# `objects/obj_enemy_wolf/Step_0.gml`

## What it does
Updates wolf behavior, invincibility, knockback, and movement while gameplay is active.

## When it runs
Once per frame while `GAME_STATE.PLAYING`.

## Important responsibilities
Runs the wolf's state behavior and shared enemy damage response.

## Inputs and outputs
Reads state, health, timers, and knockback fields; changes movement and combat state.

## Relationships
Child of `obj_enemy`; depends on predator states and damage logic.

## Learning concepts
A state machine lets the same enemy switch between patrol, chase, and attack rules.

## Known notes
Uses the unusual legacy enemy movement path documented in the enemy hierarchy.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
