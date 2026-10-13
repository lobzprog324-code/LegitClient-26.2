execute unless score @s farm_q_delivery matches 1 run tellraw @s {"text":"Пип: Сначала возьми у меня задание на доставку.","color":"yellow"}
execute unless score @s farm_q_delivery matches 1 run return 0
execute unless items entity @s inventory.* minecraft:bread run tellraw @s {"text":"Пип: Не хватает хлеба! Мара выдаёт его за первое задание.","color":"yellow"}
execute unless items entity @s inventory.* minecraft:bread run return 0
execute unless items entity @s inventory.* minecraft:potato run tellraw @s {"text":"Пип: Заказу нужен ещё один картофель.","color":"yellow"}
execute unless items entity @s inventory.* minecraft:potato run return 0
clear @s minecraft:bread 1
clear @s minecraft:potato 1
scoreboard players set @s farm_q_delivery 2
scoreboard players add @s farm_money 25
give @s minecraft:cookie 8
tellraw @s {"text":"Пип: Заказ доставлен! Получай 25 монет и печенье для дороги!","color":"gold"}
effect give @s minecraft:speed 30 0 true
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.8 1.2
