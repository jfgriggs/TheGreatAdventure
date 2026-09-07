# `objects/obj_item_tomato/Create_0.gml`

## What it does
Configures a tomato item with `ITEM.TOMATO`, its definition, life value, sprite, and mask.

## When it runs
When a tomato item is created.

## Important responsibilities
Sets tomato identity and visuals while inheriting shared item behavior.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; uses `Item_Create` from `scr_items`.

## Learning concepts
A child configuration layer is smaller and clearer than duplicated behavior.

## Known notes
Calls `event_inherited()`; no custom runtime logic is present.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
