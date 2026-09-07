# `objects/obj_trap/Step_0.gml`

## What it does
Counts down a trap, destroys it when its lifetime ends, and damages nearby supported enemies.

## When it runs
Once per frame while gameplay is active.

## Important responsibilities
Gates on game state, decreases `lifetime`, checks distance within `radius`, and applies trap effects.

## Inputs and outputs
Reads trap position, radius, lifetime, and enemy instances; mutates enemy health and trap lifetime.

## Relationships
Uses `obj_enemy_archer` and `obj_enemy_wolf` target checks plus damage logic.

## Learning concepts
Area effects apply one action to every target inside a measured region.

## Known notes
Target types are explicitly listed in the source.
