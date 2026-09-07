# `objects/obj_animal_sheep/Create_0.gml`

## What it does
Identifies the instance as a sheep for the shared animal system.

## When it runs
It runs when a sheep instance is created.

## Important responsibilities
It sets `ANIMAL.SHEEP` and calls `event_inherited()`.

## Inputs and outputs
It writes the animal type consumed by the parent and returns nothing.

## Relationships
Child of `obj_animal`; depends on the parent's shared initialization and `scr_animals`.

## Learning concepts
A child can provide one small setting while inheriting a complete behavior system.

## Known notes
This is a configuration-only child Create event.
