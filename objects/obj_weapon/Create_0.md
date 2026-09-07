# `objects/obj_weapon/Create_0.gml`

## What it does
Initializes the shared weapon instance and its default runtime fields before a concrete weapon selects a definition.

## When it runs
When a weapon instance is created.

## Important responsibilities
Prepares fields for weapon identity, firing, cooldowns, sprites, and the owning player or inventory.

## Inputs and outputs
Reads child configuration and writes shared weapon fields, including weapon data and runtime timing values.

## Relationships
Parent of bow, boomerang, magic staff, shotgun, and slingshot. Depends on `scr_weapons` and projectile objects.

## Learning concepts
A parent initializes common machinery; children choose which tool that machinery represents.

## Known notes
Concrete child definitions are centralized in `scr_weapons`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
