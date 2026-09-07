# `objects/obj_item_thrown/Step_0.gml`

## What it does
Moves a thrown item, stops it at blocking tiles, and turns it back into an inventory item when its travel ends or it reaches a limit.

## When it runs
Once per frame for each thrown item while gameplay is active.

## Important responsibilities
It applies drag, checks distance and speed, tests thrown-item tile blocking, updates position, and creates a normal item when appropriate.

## Inputs and outputs
It reads `vx`, `vy`, `drag`, `item`, `start_x`, `start_y`, and `max_distance`; it mutates motion and may create an item instance or destroy itself.

## Relationships
Depends on `scr_tiles` for collision and `scr_items` for item data. The launching owner is stored in `owner`.

## Learning concepts
Converting one object into another is a handoff between gameplay states. A frame-by-frame update simulates motion over time.

## Known notes
The event uses its own `vx` and `vy` fields rather than the shared movement contract.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
