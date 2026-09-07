# `objects/obj_pen/Create_0.gml`

## What it does
Initializes shared pen data, including `score_value`, for animal containment areas.

## When it runs
When a pen instance is created.

## Important responsibilities
Provides common scoring configuration for pen children.

## Inputs and outputs
Writes `score_value = 100`; no parameters or return value.

## Relationships
Parent of species pen objects and paired with the pen Step event.

## Learning concepts
A parent can store a default used by several children.

## Known notes
The source contains configuration only; detailed containment logic is not active in this Create event.
