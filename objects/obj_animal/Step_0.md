# `objects/obj_animal/Step_0.gml`

## What it does
Updates shared animal state, movement, safety, animation, and interactions while the game is active.

## When it runs
It runs once per game frame for each animal instance.

## Important responsibilities
It gates gameplay on `GAME_STATE.PLAYING`, updates the state machine, applies movement and tile checks, and maintains the animal's current behavior.

## Inputs and outputs
It reads `sm`, movement fields, `global.game_state`, and tile queries, then mutates position, velocity, state time, and animation-related values.

## Relationships
It is the runtime event for `obj_animal` and serves chicken, cow, pig, and sheep children. It uses `scr_movement`, `scr_tiles`, and animal states.

## Learning concepts
A Step event is a repeating update. Gating means checking whether the game is allowed to advance before changing gameplay.

## Known notes
The event uses the shared animal movement path; species-specific configuration remains in child Create events.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
