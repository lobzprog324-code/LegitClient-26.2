execute unless score @s farm_q_welcome matches 1 run tellraw @s {"text":"Мара: Сначала начни исследование, потом возвращайся со всеми находками.","color":"yellow"}
execute unless score @s farm_q_welcome matches 1 run return 0
execute unless items entity @s inventory.* minecraft:wheat_seeds run tellraw @s {"text":"Мара: Не хватает семени пшеницы. Посмотри на грядки!","color":"yellow"}
execute unless items entity @s inventory.* minecraft:wheat_seeds run return 0
execute unless items entity @s inventory.* minecraft:carrot run tellraw @s {"text":"Мара: Не хватает моркови. Проверь морковную грядку!","color":"yellow"}
execute unless items entity @s inventory.* minecraft:carrot run return 0
execute unless items entity @s inventory.* minecraft:potato run tellraw @s {"text":"Мара: Не хватает картофеля. Осмотри последнюю грядку!","color":"yellow"}
execute unless items entity @s inventory.* minecraft:potato run return 0
clear @s minecraft:wheat_seeds 1
clear @s minecraft:carrot 1
clear @s minecraft:potato 1
scoreboard players set @s farm_q_welcome 2
scoreboard players add @s farm_money 15
give @s minecraft:bread 6
tellraw @s {"text":"Мара: Ты собрал все находки! Вот 15 монет и хлеб. Теперь Рук ищет помощника для животных.","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.7 1.2
