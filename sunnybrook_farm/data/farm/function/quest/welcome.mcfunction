execute unless score @s farm_q_welcome matches 0.. run scoreboard players set @s farm_q_welcome 0
execute if score @s farm_q_welcome matches 2 run tellraw @s {"text":"Мара: Ты уже стал настоящим исследователем фермы. Загляни к Руку за новым заданием!","color":"green"}
execute if score @s farm_q_welcome matches 2 run return 0
execute if score @s farm_q_welcome matches 1 run tellraw @s {"text":"Мара: Исследуй грядки и принеси мне семена пшеницы, морковь и картофель. Когда всё соберёшь, нажми «Сдать находки» в моём меню.","color":"yellow"}
execute if score @s farm_q_welcome matches 1 run return 0
scoreboard players set @s farm_q_welcome 1
tellraw @s {"text":"Мара: Первая миссия! Осмотри грядки и собери настоящие находки: 1 семя пшеницы, 1 морковь и 1 картофель. Вернись ко мне и выбери «Сдать находки».","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.7 1.2
