# `objects/obj_item_carrot/Create_0.gml`

## What it does
Configures an item as carrot using `ITEM.CARROT`, its centralized definition, life value, and sprite mask.

## When it runs
When a carrot item is created.

## Important responsibilities
Selects carrot identity and presentation while inheriting shared item setup.

## Inputs and outputs
Writes `item_type`, `item`, `life`, `sprite_index`, and `mask_index`.

## Relationships
Child of `obj_item`; depends on `scr_items`.

## Learning concepts
Children can specialize data without rewriting parent behavior.

## Known notes
Calls `event_inherited()` and is otherwise configuration-focused.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
