# `objects/obj_item_watermelon/Create_0.gml`

## What it does
Configures a watermelon item with `ITEM.WATERMELON`, its definition, life, sprite, and mask.

## When it runs
When a watermelon item is created.

## Important responsibilities
Selects watermelon data and presentation after inherited initialization.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; depends on `scr_items`.

## Learning concepts
A factory returns a consistent data package for the selected item.

## Known notes
Simple configuration-only child Create event using `event_inherited()`.
