execute if score @s farm_action matches 1 run function farm:quest/welcome
execute if score @s farm_action matches 2 run function farm:quest/animals
execute if score @s farm_action matches 3 run function farm:quest/delivery
execute if score @s farm_action matches 4 run function farm:quest/pond
execute if score @s farm_action matches 5 run function farm:shop/buy_garden
execute if score @s farm_action matches 6 run function farm:shop/buy_coop
execute if score @s farm_action matches 7 run function farm:shop/buy_windmill
execute if score @s farm_action matches 8 run function farm:event/start
execute if score @s farm_action matches 9 run function farm:quest/gift
execute if score @s farm_action matches 10 run function farm:quest/turnin_welcome
execute if score @s farm_action matches 11 run function farm:quest/turnin_animals
execute if score @s farm_action matches 12 run function farm:quest/turnin_delivery
execute if score @s farm_action matches 13 run function farm:quest/turnin_pond
scoreboard players set @s farm_action 0
scoreboard players enable @s farm_action
