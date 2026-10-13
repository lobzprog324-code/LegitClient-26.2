scoreboard players enable @a farm_quest
scoreboard players enable @a farm_shop
scoreboard players enable @a farm_event
execute as @a[scores={farm_quest=1..}] at @s run function farm:quest
execute as @a[scores={farm_shop=1..}] at @s run function farm:shop
execute as @a[scores={farm_event=1..}] at @s run function farm:event
execute as @a[scores={farm_timer=1..}] run scoreboard players remove @s farm_timer 1
execute as @a[scores={farm_timer=0}] run function farm:event_finish