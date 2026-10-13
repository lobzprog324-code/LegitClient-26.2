# Starter farm centered on the player
fill ~-12 ~-1 ~-12 ~12 ~-1 ~12 minecraft:coarse_dirt
fill ~-12 ~ ~-12 ~12 ~ ~12 minecraft:grass_block
fill ~-12 ~ ~-12 ~12 ~ ~-12 minecraft:oak_log
fill ~-12 ~ ~12 ~12 ~ ~12 minecraft:oak_log
fill ~-12 ~ ~-12 ~-12 ~ ~12 minecraft:oak_log
fill ~12 ~ ~-12 ~12 ~ ~12 minecraft:oak_log
fill ~-1 ~ ~-11 ~1 ~ ~11 minecraft:gravel
fill ~-5 ~ ~-8 ~1 ~3 ~-4 minecraft:oak_planks
fill ~-4 ~1 ~-7 ~0 ~2 ~-5 minecraft:air
fill ~-2 ~ ~-4 ~-2 ~1 ~-4 minecraft:air
fill ~-6 ~4 ~-9 ~2 ~4 ~-3 minecraft:spruce_planks
fill ~4 ~ ~-8 ~9 ~ ~-4 minecraft:farmland[moisture=7]
setblock ~6 ~ ~-6 minecraft:water
setblock ~4 ~1 ~-8 minecraft:wheat[age=7]
setblock ~5 ~1 ~-8 minecraft:carrots[age=7]
setblock ~6 ~1 ~-8 minecraft:potatoes[age=7]
fill ~4 ~ ~4 ~9 ~3 ~9 minecraft:dark_oak_planks
fill ~5 ~1 ~5 ~8 ~2 ~8 minecraft:air
fill ~3 ~4 ~3 ~10 ~4 ~10 minecraft:dark_oak_planks
fill ~-9 ~ ~3 ~-5 ~ ~6 minecraft:oak_planks
fill ~-9 ~2 ~3 ~-5 ~2 ~6 minecraft:red_wool
fill ~-10 ~ ~-9 ~-7 ~ ~-6 minecraft:water
execute unless entity @e[type=minecraft:villager,tag=farm_guide,distance=..30] run summon minecraft:villager ~0 ~ ~-2 {Tags:["farm_guide"],CustomName:"Mara - Farm Mentor",PersistenceRequired:1b,VillagerData:{profession:"minecraft:farmer",level:2,type:"minecraft:plains"}}
execute unless entity @e[type=minecraft:villager,tag=farm_trader,distance=..30] run summon minecraft:villager ~-7 ~ ~4 {Tags:["farm_trader"],CustomName:"Pip - Market Trader",PersistenceRequired:1b,VillagerData:{profession:"minecraft:farmer",level:2,type:"minecraft:plains"}}
execute unless entity @e[type=minecraft:villager,tag=farm_mechanic,distance=..30] run summon minecraft:villager ~7 ~ ~7 {Tags:["farm_mechanic"],CustomName:"Rook - Tinkerer",PersistenceRequired:1b,VillagerData:{profession:"minecraft:toolsmith",level:2,type:"minecraft:plains"}}
execute unless entity @e[type=minecraft:mannequin,tag=farm_npc_guide,distance=..30] run summon minecraft:mannequin ~-1 ~ ~-2 {Tags:["farm_npc_guide"],CustomNameVisible:1b,hide_description:true,CustomName:'{"text":"Mara","color":"green"}',Invulnerable:1b,PersistenceRequired:1b}
execute unless entity @e[type=minecraft:mannequin,tag=farm_npc_trader,distance=..30] run summon minecraft:mannequin ~-7 ~ ~3 {Tags:["farm_npc_trader"],CustomNameVisible:1b,hide_description:true,CustomName:'{"text":"Pip","color":"gold"}',Invulnerable:1b,PersistenceRequired:1b}
execute unless entity @e[type=minecraft:mannequin,tag=farm_npc_mechanic,distance=..30] run summon minecraft:mannequin ~7 ~ ~6 {Tags:["farm_npc_mechanic"],CustomNameVisible:1b,hide_description:true,CustomName:'{"text":"Rook","color":"aqua"}',Invulnerable:1b,PersistenceRequired:1b}
tellraw @s {"text":"Farm built! Meet the new mannequin NPCs Mara, Pip, and Rook, plus the working villagers. Run /function farm:help for quests.","color":"green"}