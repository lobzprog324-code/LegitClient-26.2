execute unless score @s farm_q_delivery matches 0.. run scoreboard players set @s farm_q_delivery 0
execute if score @s farm_q_delivery matches 2 run tellraw @s {"text":"Пип: Заказ уже доставлен! Ты отличный курьер.","color":"green"}
execute if score @s farm_q_delivery matches 2 run return 0
execute if score @s farm_q_delivery matches 1 run tellraw @s {"text":"Пип: Заказ ещё ждёт! Принеси 1 хлеб и 1 картофель, затем выбери «Сдать заказ».","color":"yellow"}
execute if score @s farm_q_delivery matches 1 run return 0
scoreboard players set @s farm_q_delivery 1
tellraw @s {"text":"Пип: У меня заказ для соседей! Собери 1 хлеб и 1 картофель. Хлеб можно получить за первое задание Мары. Вернись и нажми «Сдать заказ».","color":"gold"}
