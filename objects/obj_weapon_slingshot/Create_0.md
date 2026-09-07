# `objects/obj_weapon_slingshot/Create_0.gml`

## What it does
Configures a slingshot weapon with its selected definition and inherited weapon setup.

## When it runs
When a slingshot is created.

## Important responsibilities
Chooses slingshot identity and presentation for shared firing behavior.

## Inputs and outputs
Writes weapon type, definition, sprite, and mask fields.

## Relationships
Child of `obj_weapon`; depends on `scr_weapons`.

## Learning concepts
A parent can provide one firing system for several specialized children.

## Known notes
Simple configuration-only Create event calling `event_inherited()`.
