# `objects/obj_enemy_wolf/Create_0.gml`

## What it does
Configures wolf speed, health, invincibility, knockback, and an instance movement function.

## When it runs
When a wolf enemy is created.

## Important responsibilities
Sets wolf-specific tuning needed by predator states and damage response.

## Inputs and outputs
Writes `speed`, `hp`, `iframes`, knockback fields, and `apply_movement`.

## Relationships
Child of `obj_enemy`; uses predator state logic.

## Learning concepts
An instance function can be called by the object's own behavior as a stored callback.

## Known notes
The movement fields are part of the observed legacy enemy implementation.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
