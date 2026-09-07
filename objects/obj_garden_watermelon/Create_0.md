# `objects/obj_garden_watermelon/Create_0.gml`

## What it does
Configures a watermelon plant with `ITEM.WATERMELON`, its garden sprite, and pickup sound.

## When it runs
When a watermelon plant is created.

## Important responsibilities
Chooses concrete item and visual settings, then uses inherited plant initialization.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
Inheritance prevents each vegetable from repeating growth and harvest code.

## Known notes
Configuration-only child Create event; it calls `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
