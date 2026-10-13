execute if score @s farm_money matches 60.. run scoreboard players remove @s farm_money 60
execute if score @s farm_money matches ..59 run tellraw @s {"text":"Пока не хватает монет. Выполни задания и возвращайся!","color":"red"}
execute if score @s farm_money matches ..59 run return 0
fill ~-22 ~ ~-3 ~-18 ~5 ~1 minecraft:spruce_planks
fill ~-24 ~4 ~-2 ~-16 ~4 ~0 minecraft:white_wool
tellraw @s {"text":"Мельница построена! Ферма становится красивее! -60 монет.","color":"aqua"}
playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.8 1.2