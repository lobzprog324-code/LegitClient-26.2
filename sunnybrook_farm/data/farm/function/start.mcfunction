scoreboard players add @s farm_money 50
function farm:build
scoreboard objectives setdisplay sidebar farm_money
tellraw @s {"text":"Welcome to Sunnybrook Farm! Start with /trigger farm_quest set 1. Shop: /trigger farm_shop set 1.","color":"gold"}
title @s title {"text":"Sunnybrook Farm","color":"green"}
title @s subtitle {"text":"A little farm with big adventures","color":"yellow"}