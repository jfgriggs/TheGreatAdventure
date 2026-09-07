# `objects/obj_player/Step_0.gml`

## What it does
Updates player input, state machine, movement, attacks, damage effects, and game-over interactions.

## When it runs
Once per frame for the player during gameplay.

## Important responsibilities
Gates on `GAME_STATE.PLAYING`, updates the active player state, moves through the shared movement system, and coordinates equipment and survival.

## Inputs and outputs
Reads input, `sm`, inventory, weapons, health, and global state; mutates position, velocity, combat state, and timers.

## Relationships
Runtime event for `obj_player` and its character children. Uses player states plus movement, damage, item, and weapon scripts.

## Learning concepts
Input is read each frame. The player state machine turns input and world facts into actions.

## Known notes
Shared movement remains in the movement subsystem rather than being duplicated in player states.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
