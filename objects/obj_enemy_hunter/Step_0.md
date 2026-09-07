# `objects/obj_enemy_hunter/Step_0.gml`

## What it does
Updates hunter behavior, game-state gating, invincibility, knockback, movement, and attack timing.

## When it runs
Once per frame while `GAME_STATE.PLAYING`.

## Important responsibilities
Runs the hunter's current behavior and processes common enemy combat response.

## Inputs and outputs
Reads hunter tuning, state, health, timers, target, and knockback fields; mutates movement and combat state.

## Relationships
Uses the enemy hierarchy and state-machine callbacks, with damage and player state as dependencies.

## Learning concepts
A callback lets the current state decide what happens this frame. Shared parent behavior handles common enemy rules.

## Known notes
This uses the observed legacy enemy movement path; it is intentionally documented rather than normalized here.
