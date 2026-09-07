# `objects/obj_pen_cow/Create_0.gml`

## What it does
Configures the pen to accept cows by inheriting the parent event and setting `accepted_animal = ANIMAL.COW`.

## When it runs
When a cow pen is created.

## Important responsibilities
Provides cow-specific identity; parent setup remains shared.

## Inputs and outputs
Writes `accepted_animal`; returns nothing.

## Relationships
Child of `obj_pen`.

## Learning concepts
Inheritance lets one pen system support several animal types.

## Known notes
Configuration-only child Create event.
