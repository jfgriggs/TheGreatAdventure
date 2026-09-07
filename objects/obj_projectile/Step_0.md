# `objects/obj_projectile/Step_0.gml`

## What it does
Runs shared projectile travel, tile collision, range or lifetime checks, and hit processing.

## When it runs
Once per frame for projectile instances during gameplay.

## Important responsibilities
Moves the projectile, stops it at blocking fired-weapon tiles, applies combat effects, and destroys it when its flight ends.

## Inputs and outputs
Reads position, direction, speed, owner, damage, and range fields; mutates position and may damage or destroy instances.

## Relationships
Runtime parent for projectile children; uses `scr_tiles` and `scr_damage`.

## Learning concepts
A collision is a rule that decides when moving objects meet a barrier or target.

## Known notes
Projectile variants add their own behavior where their flight shape or target handling differs.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
