# Lobzik Minecraft Bot

A command-driven Minecraft Java bot built on Mineflayer. The old Fabric client is being retired.

## Requirements and setup

- Node.js 22 or newer.
- A Minecraft Java server you own or are authorized to use.
- Copy `.env.example` to `.env`, then configure `MC_HOST`, `MC_PORT`, `MC_USERNAME`, and `BOT_OWNER` (your Minecraft username).
- On a private offline-mode server only, use `MC_AUTH=offline`. For online-mode use `MC_AUTH=microsoft` and complete the Microsoft device login in the terminal. Never put passwords or tokens in `.env`.
- Run `npm install`, then `npm start`.

The Mineflayer package is an updated fork that advertises support for Minecraft 1.8 through 26.3, including 26.2. The standard upstream package currently lists support through 26.1. See https://github.com/PrismarineJS/mineflayer and https://www.npmjs.com/package/@wp2508/mineflayer.

## Chat commands

- `!help` — show commands.
- `!mine <block_name> <amount>` — mine up to 1–512 nearby reachable blocks. Example: `!mine cobblestone 32`.
- `!come` — walk to the owner.
- `!follow` — follow the owner.
- `!stop` — cancel the current task/navigation.
- `!guard` — report defensive settings.
- `!status` — show health, food, and task state.

Use registry names such as `iron_ore`, `oak_log`, `coal_ore`, and `cobblestone`. Mining counts blocks, not the number of dropped items. The bot only searches loaded nearby chunks; it will not reliably mine across an entire world. After mining, it tries to return and drop the gathered resources near the owner.

## Navigation and defense

Pathfinder can dig around obstacles and light parkour is enabled. Self-defense targets nearby hostile mobs and prioritizes running away at critically low health. Attacking players is disabled by default; set `ALLOW_PLAYER_COMBAT=true` only if this is appropriate and allowed on your server. Pathfinding cannot guarantee safety around every ravine, lava pool, or server-specific obstacle. Test in a private world first and follow server rules.
