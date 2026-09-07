# `objects/obj_weapon_boomerang/Create_0.gml`

## What it does
Configures the weapon as a boomerang using its centralized weapon definition and inherited setup.

## When it runs
When a boomerang weapon is created.

## Important responsibilities
Selects boomerang identity and presentation for shared weapon behavior.

## Inputs and outputs
Writes weapon type, definition, sprite, and mask fields.

## Relationships
Child of `obj_weapon`; depends on `scr_weapons`.

## Learning concepts
Child objects can choose data while the parent controls common firing behavior.

## Known notes
Simple configuration-only Create event using `event_inherited()`.
