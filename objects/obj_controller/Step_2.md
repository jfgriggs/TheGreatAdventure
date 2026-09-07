# `objects/obj_controller/Step_2.gml`

## What it does
Performs a second controller Step event for additional recurring world or camera-related controller work.

## When it runs
Once per frame in GameMaker's Step 2 event order.

## Important responsibilities
It updates the controller-owned behavior placed in this later phase, after the regular Step event.

## Inputs and outputs
Reads controller and global state and mutates the fields or instances managed by this event.

## Relationships
Part of `obj_controller`; later events can depend on work done in `Step_0`.

## Learning concepts
Event order is the sequence in which a game runs different pieces of code each frame.

## Known notes
This event is intentionally separate from the controller's normal Step timing.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
