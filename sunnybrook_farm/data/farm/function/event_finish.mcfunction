execute if score @s farm_timer matches 0 run scoreboard players add @s farm_money 15
execute if score @s farm_timer matches 0 run tellraw @s {"text":"Праздник окончен! Спасибо за участие — +15 монет!","color":"gold"}
scoreboard players set @s farm_timer -1