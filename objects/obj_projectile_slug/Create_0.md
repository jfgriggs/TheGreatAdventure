# `objects/obj_projectile_slug/Create_0.gml`

## What it does
Initializes a slug with speed, direction, damage, maximum travel distance, and origin after inherited setup.

## When it runs
When a slug projectile is created.

## Important responsibilities
Sets slug-specific projectile values.

## Inputs and outputs
Writes `speed`, `direction`, `damage`, `max_distance`, `start_x`, and `start_y`.

## Relationships
Child of `obj_projectile`; uses shared tile and damage behavior.

## Learning concepts
Initialization records the values needed for later frame updates.

## Known notes
Configuration extends the parent projectile Create event.
