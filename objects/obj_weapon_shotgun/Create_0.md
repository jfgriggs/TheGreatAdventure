# `objects/obj_weapon_shotgun/Create_0.gml`

## What it does
Configures a shotgun weapon through its centralized definition and inherited weapon setup.

## When it runs
When a shotgun instance is created.

## Important responsibilities
Selects shotgun data and visual fields; shared weapon code owns firing.

## Inputs and outputs
Writes weapon identity, definition, sprite, and mask fields.

## Relationships
Child of `obj_weapon`; depends on `scr_weapons` and its projectile configuration.

## Learning concepts
Central definitions let several weapon objects share a common runtime.

## Known notes
Configuration-only child Create event using `event_inherited()`.
