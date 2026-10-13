execute if score @s farm_money matches 20.. run scoreboard players remove @s farm_money 20
execute if score @s farm_money matches ..19 run tellraw @s {"text":"Пока не хватает монет. Поговори с Марой или Рук за заданиями!","color":"red"}
execute if score @s farm_money matches ..19 run return 0
fill ~15 ~ ~-5 ~21 ~ ~2 minecraft:farmland[moisture=7]
setblock ~18 ~ ~-1 minecraft:water
tellraw @s {"text":"Новые грядки построены! -20 монет.","color":"green"}
playsound minecraft:block.crop.plant master @s ~ ~ ~ 0.8 1.0