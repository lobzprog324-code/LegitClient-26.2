execute if score @s farm_event matches 1 run scoreboard players set @s farm_timer 1200
execute if score @s farm_event matches 1 run title @s title {"text":"Harvest Festival!","color":"gold"}
execute if score @s farm_event matches 1 run title @s subtitle {"text":"60 seconds: visit pond, market, and barn","color":"yellow"}
execute if score @s farm_event matches 1 run tellraw @s {"text":"Festival started! Sprint between the pond, market, and barn. Your bonus arrives when the timer ends.","color":"gold"}
execute if score @s farm_event matches 1 run effect give @s minecraft:speed 60 0 true
scoreboard players set @s farm_event 0
scoreboard players enable @s farm_event