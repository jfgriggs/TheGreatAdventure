# `objects/obj_garden_pepper/Create_0.gml`

## What it does
Configures a pepper plant with `ITEM.PEPPER`, its garden sprite, and pickup sound.

## When it runs
When a pepper plant is created.

## Important responsibilities
Provides concrete item identity and visuals after calling the parent Create event.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`; returns nothing.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
`event_inherited()` reuses the parent's initialization.

## Known notes
Configuration-only child event.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
