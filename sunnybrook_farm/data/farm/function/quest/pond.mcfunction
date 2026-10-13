execute unless score @s farm_q_pond matches 0.. run scoreboard players set @s farm_q_pond 0
execute if score @s farm_q_pond matches 2 run tellraw @s {"text":"Мара: Тайна пруда уже раскрыта! Отличная работа.","color":"aqua"}
execute if score @s farm_q_pond matches 2 run return 0
execute if score @s farm_q_pond matches 1 run tellraw @s {"text":"Мара: Ищи спрятанный аметистовый осколок у берега пруда и за домом. Потом нажми «Сдать секрет».","color":"yellow"}
execute if score @s farm_q_pond matches 1 run return 0
scoreboard players set @s farm_q_pond 1
tellraw @s {"text":"Мара: У пруда спрятан маленький клад! Найди сундук у дальнего берега, забери аметистовый осколок и принеси его мне. Нажми «Сдать секрет», когда вернёшься.","color":"aqua"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.7 1.2
