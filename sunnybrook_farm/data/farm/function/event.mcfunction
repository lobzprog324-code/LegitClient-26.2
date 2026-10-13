execute if score @s farm_event matches 1 run tellraw @s {"text":"Harvest Festival! Explore the farm, race a friend between pond and barn, and claim a secret quest for bonus loot. +15 coins!","color":"gold"}
execute if score @s farm_event matches 1 run scoreboard players add @s farm_money 15
execute if score @s farm_event matches 1 run effect give @s minecraft:speed 60 0 true
scoreboard players set @s farm_event 0
scoreboard players enable @s farm_event