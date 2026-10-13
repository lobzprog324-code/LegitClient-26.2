execute if score @s farm_quest matches 1 run tellraw @s {"text":"Mara: Welcome home! Explore the cottage, pond, and barn. Gift: +15 coins and bread.","color":"green"}
execute if score @s farm_quest matches 1 run scoreboard players add @s farm_money 15
execute if score @s farm_quest matches 1 run give @s minecraft:bread 6
execute if score @s farm_quest matches 2 run tellraw @s {"text":"Animal rescue! Rook thanks you for helping the barn. +20 coins, hay, and carrots.","color":"gold"}
execute if score @s farm_quest matches 2 run scoreboard players add @s farm_money 20
execute if score @s farm_quest matches 2 run give @s minecraft:hay_block 3
execute if score @s farm_quest matches 2 run give @s minecraft:carrot 3
execute if score @s farm_quest matches 3 run tellraw @s {"text":"Pip: Delivery Dash! Visit the market, pond, and barn. Reward: +25 coins and cookies.","color":"yellow"}
execute if score @s farm_quest matches 3 run scoreboard players add @s farm_money 25
execute if score @s farm_quest matches 3 run give @s minecraft:cookie 8
execute if score @s farm_quest matches 4 run tellraw @s {"text":"Secret pond reward! +10 coins and amethyst.","color":"light_purple"}
execute if score @s farm_quest matches 4 run scoreboard players add @s farm_money 10
execute if score @s farm_quest matches 4 run give @s minecraft:amethyst_shard 2
scoreboard players set @s farm_quest 0
scoreboard players enable @s farm_quest