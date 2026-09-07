# `objects/obj_garden_corn/Create_0.gml`

## What it does
Configures the shared plant as corn with `ITEM.CORN`, the corn garden sprite, and the pickup sound.

## When it runs
When a corn plant is created.

## Important responsibilities
Sets concrete identity and visuals, then relies on inherited plant behavior.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`; no parameters or return value.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
A parent can provide a reusable lifecycle while children provide settings.

## Known notes
Configuration-only Create event that calls `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
