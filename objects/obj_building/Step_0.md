# `objects/obj_building/Step_0.gml`

## What it does
Runs the recurring building interaction or update logic defined for the base building object.

## When it runs
Once per frame for building instances.

## Important responsibilities
Maintains the building behavior placed in this shared Step event and responds to active game conditions.

## Inputs and outputs
Reads building instance fields and nearby world state and mutates any building runtime values controlled here.

## Relationships
Base event for building children such as barn, coop, house, well, and windmill.

## Learning concepts
A parent object can provide one common runtime event for many building types.

## Known notes
This event contains shared building behavior; child-specific setup is stored in child objects.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
