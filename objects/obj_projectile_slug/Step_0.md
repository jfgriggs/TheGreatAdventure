# `objects/obj_projectile_slug/Step_0.gml`

## What it does
Moves the slug, checks wall tiles, tests enemy targets, and destroys it after its travel limit.

## When it runs
Once per frame while gameplay is active.

## Important responsibilities
Calculates next position, applies hit behavior to supported enemy types, and removes the projectile when blocked or spent.

## Inputs and outputs
Reads speed, direction, damage, and origin; mutates position and enemy health or lifetime.

## Relationships
Child of `obj_projectile`; uses `Tile_Is_Blocking_Fired_Weapon` and enemy instances.

## Learning concepts
A projectile can query several target types and apply the same hit idea to each.

## Known notes
Target checks are explicitly written for the enemy objects named in the source.
