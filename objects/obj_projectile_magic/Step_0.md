# `objects/obj_projectile_magic/Step_0.gml`

## What it does
Advances magic projectile motion and handles wall collision, range, and target effects.

## When it runs
Once per frame during active gameplay.

## Important responsibilities
Calculates travel, checks fired-weapon blocking tiles, processes hits, and removes expired projectiles.

## Inputs and outputs
Reads magic projectile fields and mutates position, hit targets, and instance lifetime.

## Relationships
Child runtime event of `obj_projectile`; used by magic weapon configuration.

## Learning concepts
A projectile owns its flight until it reaches a wall, target, or limit.

## Known notes
Its behavior is kept separate from the weapon that created it.
