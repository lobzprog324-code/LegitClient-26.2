execute if score @s farm_shop matches 1 run function farm:help
execute if score @s farm_shop matches 2 if score @s farm_money matches 20.. run scoreboard players remove @s farm_money 20
execute if score @s farm_shop matches 2 if score @s farm_money matches ..19 run tellraw @s {"text":"Garden costs 20 coins. Finish a quest first!","color":"red"}
execute if score @s farm_shop matches 2 if score @s farm_money matches ..19 run scoreboard players set @s farm_shop 0
execute if score @s farm_shop matches 2 run fill ~15 ~ ~-5 ~21 ~ ~2 minecraft:farmland[moisture=7]
execute if score @s farm_shop matches 2 run setblock ~18 ~ ~-1 minecraft:water
execute if score @s farm_shop matches 2 run tellraw @s {"text":"Garden expansion unlocked! (-20 coins)","color":"green"}
execute if score @s farm_shop matches 3 if score @s farm_money matches 35.. run scoreboard players remove @s farm_money 35
execute if score @s farm_shop matches 3 if score @s farm_money matches ..34 run tellraw @s {"text":"Chicken coop costs 35 coins. Complete quests first!","color":"red"}
execute if score @s farm_shop matches 3 if score @s farm_money matches ..34 run scoreboard players set @s farm_shop 0
execute if score @s farm_shop matches 3 run fill ~15 ~ ~4 ~21 ~3 ~9 minecraft:spruce_planks
execute if score @s farm_shop matches 3 run fill ~16 ~1 ~5 ~20 ~2 ~8 minecraft:air
execute if score @s farm_shop matches 3 run summon minecraft:chicken ~18 ~1 ~6
execute if score @s farm_shop matches 3 run summon minecraft:chicken ~19 ~1 ~6
execute if score @s farm_shop matches 3 run tellraw @s {"text":"Chicken coop unlocked! (-35 coins)","color":"green"}
execute if score @s farm_shop matches 4 if score @s farm_money matches 60.. run scoreboard players remove @s farm_money 60
execute if score @s farm_shop matches 4 if score @s farm_money matches ..59 run tellraw @s {"text":"Windmill costs 60 coins. Finish quests first!","color":"red"}
execute if score @s farm_shop matches 4 if score @s farm_money matches ..59 run scoreboard players set @s farm_shop 0
execute if score @s farm_shop matches 4 run fill ~-22 ~ ~-3 ~-18 ~5 ~1 minecraft:spruce_planks
execute if score @s farm_shop matches 4 run fill ~-24 ~4 ~-2 ~-16 ~4 ~0 minecraft:white_wool
execute if score @s farm_shop matches 4 run tellraw @s {"text":"Windmill unlocked! (-60 coins)","color":"green"}
scoreboard players set @s farm_shop 0
scoreboard players enable @s farm_shop