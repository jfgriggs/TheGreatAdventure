# `objects/obj_animal_pig/Create_0.gml`

## What it does
Identifies the instance as a pig for the shared animal system.

## When it runs
It runs when a pig instance is created.

## Important responsibilities
It sets `ANIMAL.PIG` and calls `event_inherited()` to initialize the parent.

## Inputs and outputs
It writes the selected animal type and has no return value.

## Relationships
Child of `obj_animal`; uses the parent event and `scr_animals` definitions.

## Learning concepts
Configuration tells shared code which concrete kind of thing it is working with. The parent supplies common behavior.

## Known notes
This is configuration-only child behavior.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
