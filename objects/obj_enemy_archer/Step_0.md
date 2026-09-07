# `objects/obj_enemy_archer/Step_0.gml`

## What it does
Updates the archer's state machine and damage-response movement each frame.

## When it runs
Once per frame while `GAME_STATE.PLAYING`.

## Important responsibilities
Stops while the game is not playing, updates the state machine, counts down invincibility, and applies knockback through the enemy movement function.

## Inputs and outputs
Reads game state and knockback fields; changes the state-machine time, invincibility timer, movement, and knockback values.

## Relationships
Child of `obj_enemy`; uses `scr_enemy_archer_states` and `obj_projectile_arrow`.

## Learning concepts
A ranged enemy can use one state for movement and another for attacking. The state machine coordinates those choices.

## Known notes
Uses the enemy family's unusual legacy movement path rather than the animal/player shared contract.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
