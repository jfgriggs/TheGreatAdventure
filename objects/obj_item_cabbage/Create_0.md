# `objects/obj_item_cabbage/Create_0.gml`

## What it does
Configures the shared item as cabbage by selecting `ITEM.CABBAGE`, creating its definition, copying `life`, and applying its sprite and mask.

## When it runs
When a cabbage item is created.

## Important responsibilities
Chooses cabbage data and visuals after inherited item initialization.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; uses `Item_Create` from `scr_items`.

## Learning concepts
A mask is the shape used for collision. A data factory keeps item values consistent.

## Known notes
Configuration-focused child Create event that calls `event_inherited()`.
