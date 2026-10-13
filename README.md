# Sunnybrook Farm — Minecraft Java 26.2

This branch replaces the old project on this branch with a story-driven farm tycoon datapack. The original `main` branch remains untouched.

## Install the datapack
1. Open `sunnybrook_farm/` in this repository.
2. Download the folder contents (or download the repository ZIP and extract the `sunnybrook_farm` folder).
3. Put `sunnybrook_farm` into `.minecraft/saves/<world>/datapacks/`.
4. Open the world and run `/reload`.
5. Stand in a mostly clear area and run `/function farm:start`. Creative mode is recommended for setup.

## Gameplay
- Auto-builds a cottage, crop plot, barn, market stall, pond, and three named villager characters.
- Story quests and rewards: `/trigger farm_quest set 1` (welcome), `2` (animal rescue), `3` (delivery dash), `4` (secret pond).
- Farm currency and purchases: `/trigger farm_shop set 1` for help; `2` garden (20 coins), `3` chicken coop (35 coins), `4` windmill (60 coins).
- Event: `/trigger farm_event set 1` for the Harvest Festival.
- Guide: `/function farm:help`.

The datapack is designed for Minecraft Java 26.2 and uses the singular `function` resource directory and pack format 107.1.

## Current limitations
This repository contains a datapack, not a pre-generated world save. The starter farm is built around the player where the function is run. Villagers provide character flavor; quests currently start via commands rather than right-click dialogue. Test in a copy of your world before using it in a long-running save.
