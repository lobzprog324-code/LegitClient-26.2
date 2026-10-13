execute unless score @s farm_q_animals matches 0.. run scoreboard players set @s farm_q_animals 0
execute if score @s farm_q_animals matches 2 run tellraw @s {"text":"Рук: Животные уже спасены благодаря тебе! Спасибо!","color":"green"}
execute if score @s farm_q_animals matches 2 run return 0
execute if score @s farm_q_animals matches 1 run tellraw @s {"text":"Рук: Я всё ещё жду припасы — 1 тюк сена, 1 морковь и 1 семя пшеницы. Ищи их на ферме и возвращайся ко мне.","color":"yellow"}
execute if score @s farm_q_animals matches 1 run return 0
scoreboard players set @s farm_q_animals 1
tellraw @s {"text":"Рук: У курятника закончились припасы! Найди и принеси мне 1 тюк сена, 1 морковь и 1 семя пшеницы. Тюк лежит возле амбара. Нажми «Передать припасы» после возвращения.","color":"aqua"}
