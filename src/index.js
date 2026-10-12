require('dotenv').config()

const mineflayer = require('mineflayer')
const { pathfinder, Movements, goals } = require('mineflayer-pathfinder')
const collectBlock = require('mineflayer-collectblock').plugin

const config = {
  host: process.env.MC_HOST || '127.0.0.1',
  port: Number(process.env.MC_PORT || 25565),
  username: process.env.MC_USERNAME || 'LobzikBot',
  auth: process.env.MC_AUTH || 'offline',
  version: process.env.MC_VERSION || false,
  owner: process.env.BOT_OWNER || '',
  defendRadius: Number(process.env.DEFEND_RADIUS || 8),
  allowPlayerCombat: process.env.ALLOW_PLAYER_COMBAT === 'true'
}

let bot
let movements
let task = null
let reconnectTimer = null
const hostileNames = /zombie|skeleton|creeper|spider|witch|slime|phantom|drowned|husk|stray|pillager|vindicator|ravager|enderman|blaze|ghast|hoglin|piglin_brute|warden|silverfish|endermite/i

function log (...args) { console.log(new Date().toISOString(), ...args) }
function tell (message) {
  if (bot && bot.entity) bot.chat(String(message).slice(0, 240))
  log(message)
}
function isOwner (username) {
  return !config.owner || username.toLowerCase() === config.owner.toLowerCase()
}
function stopTask (reason = 'Остановлено') {
  if (task) {
    task.cancelled = true
    task = null
  }
  if (bot && bot.pathfinder) bot.pathfinder.setGoal(null)
  if (bot && bot.collectBlock) bot.collectBlock.cancelTask()
  tell(reason)
}
function closestOwnerEntity () {
  if (!bot || !bot.players) return null
  const player = bot.players[config.owner]
  return player && player.entity ? player.entity : null
}
function distanceTo (entity) {
  return bot.entity.position.distanceTo(entity.position)
}
async function goToOwner () {
  const owner = closestOwnerEntity()
  if (!owner) {
    tell('Не вижу владельца в списке игроков. Подойди ближе и повтори команду.')
    return false
  }
  bot.pathfinder.setGoal(new goals.GoalNear(owner.position.x, owner.position.y, owner.position.z, 2))
  await waitForGoal(120000)
  return true
}
function waitForGoal (timeoutMs = 120000) {
  return new Promise(resolve => {
    let done = false
    const finish = value => {
      if (done) return
      done = true
      clearTimeout(timer)
      bot.removeListener('goal_reached', onReached)
      bot.removeListener('path_reset', onReset)
      resolve(value)
    }
    const onReached = () => finish(true)
    const onReset = () => {
      if (bot.pathfinder.goal == null) finish(false)
    }
    const timer = setTimeout(() => finish(false), timeoutMs)
    bot.once('goal_reached', onReached)
    bot.on('path_reset', onReset)
  })
}
async function mineBlocks (blockName, requestedCount) {
  if (task) return tell('Я уже выполняю задачу. Напиши !stop чтобы отменить.')
  const state = { cancelled: false }
  task = state
  tell('Начинаю добычу: ' + requestedCount + ' × ' + blockName + '. Напиши !stop для отмены.')
  let collected = 0
  try {
    while (!state.cancelled && collected < requestedCount) {
      const remaining = requestedCount - collected
      const positions = bot.findBlocks({
        matching: block => block && block.name === blockName,
        maxDistance: 48,
        count: Math.min(Math.max(remaining, 8), 64)
      })
      if (!positions.length) {
        tell('Рядом больше нет блоков ' + blockName + '. Добыто блоков: ' + collected + '/' + requestedCount + '.')
        break
      }
      const blocks = positions.map(pos => bot.blockAt(pos)).filter(Boolean)
      for (const block of blocks) {
        if (state.cancelled || collected >= requestedCount) break
        try {
          await bot.collectBlock.collect(block)
          collected++
        } catch (err) {
          log('Не удалось добыть блок:', err.message)
        }
      }
    }
    if (!state.cancelled) {
      tell('Добыча завершена. Блоков обработано: ' + collected + '/' + requestedCount + '. Иду к владельцу.')
      await goToOwner()
      if (!state.cancelled) await deliverLoot(blockName)
    }
  } catch (err) {
    tell('Задача прервана: ' + err.message)
  } finally {
    if (task === state) task = null
  }
}
async function deliverLoot (requestedName) {
  const owner = closestOwnerEntity()
  if (!owner) return tell('Не могу передать добычу: владелец не виден.')
  const items = bot.inventory.items().filter(item =>
    item.name === requestedName ||
    /cobblestone|raw_|_ore|coal|diamond|emerald|redstone|lapis|ancient_debris|deepslate|stone|gravel|sand|dirt|netherrack|quartz/i.test(item.name)
  )
  if (!items.length) return tell('Добыча в инвентаре не найдена.')
  let dropped = 0
  for (const item of items) {
    try {
      await bot.tossStack(item)
      dropped += item.count
    } catch (err) {
      log('Не удалось выбросить предмет:', item.name, err.message)
    }
  }
  tell('Подошёл к владельцу и выбросил рядом ' + dropped + ' предметов. Подбери их с земли.')
}
async function followOwner () {
  const owner = closestOwnerEntity()
  if (!owner) return tell('Не вижу владельца.')
  bot.pathfinder.setGoal(new goals.GoalFollow(owner, 2), true)
  tell('Следую за владельцем. Напиши !stop чтобы остановиться.')
}
function defendTick () {
  if (!bot || !bot.entity || bot.health == null || bot.health <= 0 || (task && task.cancelled)) return
  const candidates = Object.values(bot.entities).filter(entity => {
    if (!entity || entity === bot.entity || !entity.position || entity.isValid === false) return false
    const d = distanceTo(entity)
    if (d > config.defendRadius) return false
    if (entity.type === 'player') {
      if (!config.allowPlayerCombat || !config.owner) return false
      return entity.username !== config.owner
    }
    return entity.type === 'mob' && hostileNames.test(entity.name || '')
  }).sort((a, b) => distanceTo(a) - distanceTo(b))
  const target = candidates[0]
  if (!target) return
  if (bot.health < 8) {
    bot.pathfinder.setGoal(new goals.GoalNear(
      bot.entity.position.x + (bot.entity.position.x - target.position.x) * 3,
      bot.entity.position.y,
      bot.entity.position.z + (bot.entity.position.z - target.position.z) * 3,
      3
    ))
    return
  }
  bot.pathfinder.setGoal(new goals.GoalFollow(target, 2), true)
  if (distanceTo(target) <= 3.2) bot.attack(target)
}
function handleChat (username, message) {
  if (username === bot.username || !message.startsWith('!')) return
  if (!isOwner(username)) return
  const args = message.trim().slice(1).split(/\s+/)
  const command = (args.shift() || '').toLowerCase()
  if (command === 'help') {
    tell('Команды: !mine <block_name> <кол-во>; !come; !follow; !stop; !guard; !status; !help. Пример: !mine cobblestone 32')
  } else if (command === 'mine') {
    const blockName = (args[0] || '').toLowerCase()
    const amount = Number(args[1])
    if (!/^[a-z0-9_:-]+$/.test(blockName) || !Number.isInteger(amount) || amount < 1 || amount > 512) {
      return tell('Формат: !mine <block_name> <количество от 1 до 512>. Например !mine iron_ore 12')
    }
    mineBlocks(blockName.replace(/^minecraft:/, ''), amount)
  } else if (command === 'come') {
    goToOwner().then(ok => { if (ok) tell('Я рядом.') }).catch(err => tell('Не получилось подойти: ' + err.message))
  } else if (command === 'follow') {
    followOwner()
  } else if (command === 'stop') {
    stopTask('Задача отменена.')
  } else if (command === 'guard') {
    tell('Самооборона включена. Радиус: ' + config.defendRadius + ' блоков. Игроков атакую только если ALLOW_PLAYER_COMBAT=true.')
  } else if (command === 'status') {
    tell('HP: ' + bot.health + '/20, еда: ' + bot.food + '/20, задача: ' + (task ? 'выполняется' : 'нет') + ', стаков в инвентаре: ' + bot.inventory.items().length + '.')
  } else {
    tell('Неизвестная команда. Напиши !help.')
  }
}
function startBot () {
  bot = mineflayer.createBot({
    host: config.host,
    port: config.port,
    username: config.username,
    auth: config.auth,
    version: config.version || undefined
  })
  bot.loadPlugin(pathfinder)
  bot.loadPlugin(collectBlock)

  bot.once('spawn', () => {
    log('Подключился к ' + config.host + ':' + config.port + ' как ' + bot.username + '; версия ' + (config.version || 'авто'))
    movements = new Movements(bot)
    movements.canDig = true
    movements.allowSprinting = true
    movements.allowParkour = true
    movements.allow1by1towers = false
    movements.scafoldingBlocks = []
    bot.pathfinder.setMovements(movements)
    tell('Бот готов. Напиши !help в чат.')
  })
  bot.on('chat', handleChat)
  bot.on('health', () => {
    if (bot.health > 0 && bot.health <= 6) log('Внимание: мало здоровья:', bot.health)
  })
  bot.on('kicked', reason => log('Отключён сервером:', reason))
  bot.on('error', err => log('Ошибка Mineflayer:', err.message))
  bot.on('end', () => {
    log('Соединение закрыто.')
    if (task) task.cancelled = true
    if (process.env.AUTO_RECONNECT !== 'false') {
      clearTimeout(reconnectTimer)
      reconnectTimer = setTimeout(startBot, 5000)
    }
  })
  setInterval(defendTick, 500)
}

if (!config.owner) {
  console.warn('BOT_OWNER не задан: команды будут приниматься от любого игрока. Для приватного сервера обязательно укажи BOT_OWNER в .env.')
}
startBot()
