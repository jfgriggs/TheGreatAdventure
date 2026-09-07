# `objects/obj_pen_sheep/Create_0.gml`

## What it does
Configures the pen to accept sheep by setting `accepted_animal = ANIMAL.SHEEP` after inherited setup.

## When it runs
When a sheep pen is created.

## Important responsibilities
Supplies species identity to the shared pen object.

## Inputs and outputs
Writes `accepted_animal`; returns nothing.

## Relationships
Child of `obj_pen`.

## Learning concepts
The parent contains general behavior, while the child provides a concrete setting.

## Known notes
Configuration-only child Create event using `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
