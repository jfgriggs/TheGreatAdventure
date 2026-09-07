# `scripts/scr_globals/scr_globals.gml`

## What it does
Defines shared enums and `Globals_Initialize()`, which sets the starting game state, timing, score, player object, and spawn position.

## When it runs
The function runs during startup when the controller initializes global values.

## Important responsibilities
It provides shared names for directions, game states, animals, enemies, factions, items, and plant stages.

## Inputs and outputs
`Globals_Initialize()` has no inputs. It writes `global.tile_size`, `global.target_fps`, `global.player_object`, `global.game_state`, `global.game_time`, `global.points`, `global.best_time`, and player spawn coordinates.

## Relationships
The controller and gameplay objects depend on these globals and enum names. It has no parent or child object relationship.

## Learning concepts
An enum is a list of readable names for numbers. A global value can be read by many objects, so it should have one clear owner.

## Known notes
Initialization preserves an existing `game_state` when one already exists; otherwise it starts at `GAME_STATE.STARTING`.
