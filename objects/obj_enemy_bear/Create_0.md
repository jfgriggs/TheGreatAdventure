# `objects/obj_enemy_bear/Create_0.gml`

## What it does
Configures bear speed, health, invincibility, knockback, and its local movement function after creating shared state-machine data.

## When it runs
When a bear enemy is created.

## Important responsibilities
Sets bear-specific combat and movement tuning.

## Inputs and outputs
Writes `speed`, `hp`, `iframes`, knockback fields, and `apply_movement`.

## Relationships
Child of `obj_enemy`; uses predator states and damage behavior.

## Learning concepts
A function stored on an instance is a method-like callback for that instance.

## Known notes
The local movement setup is an observed legacy enemy pattern.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
