execute if score @s farm_timer matches 0 run scoreboard players add @s farm_money 15
execute if score @s farm_timer matches 0 run tellraw @s {"text":"Festival finished! +15 coins for joining in. Start another: /trigger farm_event set 1","color":"gold"}
scoreboard players set @s farm_timer -1