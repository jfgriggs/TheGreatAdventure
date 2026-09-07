# `objects/obj_item_corn/Create_0.gml`

## What it does
Configures a corn item with `ITEM.CORN`, the centralized item definition, its life, and sprite mask.

## When it runs
When a corn item is created.

## Important responsibilities
Sets corn-specific identity and visuals after inherited setup.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; uses `Item_Create` in `scr_items`.

## Learning concepts
Inheritance provides common item behavior; configuration selects the concrete item.

## Known notes
Simple child Create event using `event_inherited()`.
