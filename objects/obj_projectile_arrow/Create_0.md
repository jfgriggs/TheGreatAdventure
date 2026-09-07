# `objects/obj_projectile_arrow/Create_0.gml`

## What it does
Configures an arrow's speed, direction, damage, range, origin, owner, and sprite after inherited projectile setup.

## When it runs
When an arrow is fired.

## Important responsibilities
Supplies arrow-specific flight and visual data.

## Inputs and outputs
Writes `speed`, `direction`, `damage`, `max_distance`, starting coordinates, and owner-related fields.

## Relationships
Child of `obj_projectile`; created by `obj_enemy_archer` and uses tile and damage scripts.

## Learning concepts
A child projectile specializes shared flight behavior with values.

## Known notes
The arrow Draw event handles its directional presentation.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
