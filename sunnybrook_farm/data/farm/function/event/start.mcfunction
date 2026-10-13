scoreboard players set @s farm_timer 1200
title @s title {"text":"Праздник урожая!","color":"gold"}
title @s subtitle {"text":"60 секунд весёлого забега!","color":"yellow"}
tellraw @s {"text":"Беги от пруда к рынку и амбару! Через минуту получишь награду.","color":"gold"}
effect give @s minecraft:speed 60 0 true
playsound minecraft:entity.firework_rocket.launch master @s ~ ~ ~ 0.8 1.1