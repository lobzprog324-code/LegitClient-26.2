scoreboard players enable @a farm_quest
scoreboard players enable @a farm_shop
scoreboard players enable @a farm_event
execute as @a[scores={farm_quest=1..}] at @s run function farm:quest
execute as @a[scores={farm_shop=1..}] at @s run function farm:shop
execute as @a[scores={farm_event=1..}] at @s run function farm:event