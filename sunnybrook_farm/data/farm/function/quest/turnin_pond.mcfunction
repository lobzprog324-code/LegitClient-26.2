execute unless score @s farm_q_pond matches 1 run tellraw @s {"text":"Мара: Сначала начни задание о тайне пруда.","color":"yellow"}
execute unless score @s farm_q_pond matches 1 run return 0
execute unless items entity @s inventory.* minecraft:amethyst_shard run tellraw @s {"text":"Мара: Секретный осколок ещё не найден. Осмотри берег пруда и загляни за дом!","color":"aqua"}
execute unless items entity @s inventory.* minecraft:amethyst_shard run return 0
clear @s minecraft:amethyst_shard 1
scoreboard players set @s farm_q_pond 2
scoreboard players add @s farm_money 10
give @s minecraft:glow_berries 4
tellraw @s {"text":"Мара: Ты нашёл секрет у пруда! Держи 10 монет и светящиеся ягоды.","color":"aqua"}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.8 1.2
