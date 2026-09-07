# `objects/obj_pen_pig/Create_0.gml`

## What it does
Configures the pen to accept pigs by setting `accepted_animal = ANIMAL.PIG` after inherited setup.

## When it runs
When a pig pen is created.

## Important responsibilities
Selects the concrete accepted animal.

## Inputs and outputs
Writes `accepted_animal`; no parameters or return value.

## Relationships
Child of `obj_pen`.

## Learning concepts
A small child event can specialize a shared object with one data value.

## Known notes
Configuration-only and calls `event_inherited()`.
