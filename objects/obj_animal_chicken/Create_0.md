# `objects/obj_animal_chicken/Create_0.gml`

## What it does
Identifies the instance as a chicken and sets chicken-specific configuration before shared animal setup runs.

## When it runs
It runs when a chicken instance is created.

## Important responsibilities
It selects `ANIMAL.CHICKEN`, then calls `event_inherited()` so the parent initializes shared animal behavior.

## Inputs and outputs
It writes the child configuration field used by `obj_animal`; it has no parameters or return value.

## Relationships
Child of `obj_animal`; depends on the parent's Create event and animal definitions from `scr_animals`.

## Learning concepts
A child object specializes a parent. `event_inherited()` means run the parent's matching event too.

## Known notes
This is configuration-only behavior, intentionally kept small.
