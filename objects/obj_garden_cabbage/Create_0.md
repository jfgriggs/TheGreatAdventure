# `objects/obj_garden_cabbage/Create_0.gml`

## What it does
Configures a plant to grow cabbage by inheriting shared plant setup, then setting `ITEM.CABBAGE`, `spr_garden_cabbage`, and the pickup sound.

## When it runs
When the cabbage plant is created.

## Important responsibilities
Selects the concrete item and presentation values; the parent owns growth and harvest behavior.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`; no parameters or return value.

## Relationships
Child of `obj_garden_plant`; uses `scr_items` indirectly through the parent.

## Learning concepts
Configuration chooses data while inherited code performs behavior.

## Known notes
This is a simple child Create event: it calls `event_inherited()` and supplies cabbage settings.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
