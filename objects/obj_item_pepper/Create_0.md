# `objects/obj_item_pepper/Create_0.gml`

## What it does
Configures a pepper item with `ITEM.PEPPER`, its definition, life, sprite, and mask.

## When it runs
When a pepper item is created.

## Important responsibilities
Provides pepper-specific item identity and visual setup after inherited initialization.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; uses `scr_items`.

## Learning concepts
The parent supplies the common item lifecycle, while this child supplies values.

## Known notes
Simple configuration-only event calling `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
