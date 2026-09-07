# `objects/obj_item_pumpkin/Create_0.gml`

## What it does
Configures a pumpkin item with its enum type, definition, life, sprite, and mask.

## When it runs
When a pumpkin item is created.

## Important responsibilities
Selects pumpkin data and presentation after parent setup.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; depends on `scr_items`.

## Learning concepts
Configuration values tell shared code which item it is handling.

## Known notes
Configuration-only child Create event using `event_inherited()`.
