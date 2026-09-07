# `objects/obj_weapon_bow/Create_0.gml`

## What it does
Configures the weapon as `WEAPON.BOW`, creates its definition, and applies its sprite and mask after inherited setup.

## When it runs
When a bow instance is created.

## Important responsibilities
Selects bow data; shared weapon code handles runtime firing.

## Inputs and outputs
Writes `weapon_type`, `weapon`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_weapon`; uses `Weapon_Create` from `scr_weapons`.

## Learning concepts
A definition struct packages settings for one weapon.

## Known notes
Configuration-only child event calling `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
