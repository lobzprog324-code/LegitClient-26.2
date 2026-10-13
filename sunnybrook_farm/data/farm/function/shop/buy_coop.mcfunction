execute if score @s farm_money matches 35.. run scoreboard players remove @s farm_money 35
execute if score @s farm_money matches ..34 run tellraw @s {"text":"Пока не хватает монет. Выполни задание у NPC!","color":"red"}
execute if score @s farm_money matches ..34 run return 0
fill ~15 ~ ~4 ~21 ~3 ~9 minecraft:spruce_planks
fill ~16 ~1 ~5 ~20 ~2 ~8 minecraft:air
summon minecraft:chicken ~18 ~1 ~6
summon minecraft:chicken ~19 ~1 ~6
tellraw @s {"text":"Курятник построен! Теперь на ферме живут курочки! -35 монет.","color":"green"}
playsound minecraft:entity.chicken.ambient master @s ~ ~ ~ 0.8 1.0