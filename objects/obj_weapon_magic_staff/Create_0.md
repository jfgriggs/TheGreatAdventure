# `objects/obj_weapon_magic_staff/Create_0.gml`

## What it does
Configures a magic staff weapon with its enum type, definition, sprite, and mask.

## When it runs
When a magic staff is created.

## Important responsibilities
Supplies staff-specific configuration while inherited code handles shared weapon behavior.

## Inputs and outputs
Writes `weapon_type`, `weapon`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_weapon`; uses `scr_weapons`.

## Learning concepts
A child inherits behavior from a parent and can provide specialized values.

## Known notes
Configuration-only event calling `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
