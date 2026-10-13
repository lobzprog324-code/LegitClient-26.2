execute unless score @s farm_q_animals matches 1 run tellraw @s {"text":"Рук: Сначала возьми задание о припасах для животных.","color":"yellow"}
execute unless score @s farm_q_animals matches 1 run return 0
execute unless items entity @s inventory.* minecraft:hay_block run tellraw @s {"text":"Рук: Нужен тюк сена. Он лежит возле амбара — сломай его и подбери.","color":"yellow"}
execute unless items entity @s inventory.* minecraft:hay_block run return 0
execute unless items entity @s inventory.* minecraft:carrot run tellraw @s {"text":"Рук: Ещё нужна морковь для животных.","color":"yellow"}
execute unless items entity @s inventory.* minecraft:carrot run return 0
execute unless items entity @s inventory.* minecraft:wheat_seeds run tellraw @s {"text":"Рук: И не забудь семена пшеницы!","color":"yellow"}
execute unless items entity @s inventory.* minecraft:wheat_seeds run return 0
clear @s minecraft:hay_block 1
clear @s minecraft:carrot 1
clear @s minecraft:wheat_seeds 1
scoreboard players set @s farm_q_animals 2
scoreboard players add @s farm_money 20
execute unless entity @e[type=minecraft:chicken,tag=farm_rescued_chicken,distance=..30] run summon minecraft:chicken ~7 ~1 ~6 {Tags:["farm_rescued_chicken"],PersistenceRequired:1b}
execute unless entity @e[type=minecraft:sheep,tag=farm_rescued_sheep,distance=..30] run summon minecraft:sheep ~8 ~1 ~6 {Tags:["farm_rescued_sheep"],PersistenceRequired:1b}
give @s minecraft:golden_carrot 2
tellraw @s {"text":"Рук: Припасы доставлены! Курочки и овечка теперь в безопасности! Вот 20 монет и золотая морковь в награду!","color":"green"}
playsound minecraft:entity.animal.ambient master @s ~ ~ ~ 0.8 1.1
