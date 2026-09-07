# `objects/obj_item_eggplant/Create_0.gml`

## What it does
Configures an eggplant item with its enum type, definition struct, life, sprite, and collision mask.

## When it runs
When an eggplant item is created.

## Important responsibilities
Selects eggplant data and presentation after running inherited setup.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; depends on `scr_items`.

## Learning concepts
A struct groups the settings for one item. A child can override identity while reusing behavior.

## Known notes
Configuration-only child Create event.
