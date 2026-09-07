# `objects/obj_animal_cow/Create_0.gml`

## What it does
Identifies the instance as a cow and supplies the cow type to shared animal setup.

## When it runs
It runs when a cow instance is created.

## Important responsibilities
It sets `ANIMAL.COW` and calls `event_inherited()`.

## Inputs and outputs
It provides child configuration and returns nothing.

## Relationships
Child of `obj_animal`; the parent and `scr_animals` provide shared behavior and data.

## Learning concepts
Children can change identity while reusing a parent's movement and state logic. Inheritance avoids copying that logic.

## Known notes
This is a simple configuration-only Create event.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
