# `objects/obj_trap/Create_0.gml`

## What it does
Initializes a trap's lifetime and effect radius.

## When it runs
When a trap is placed or created.

## Important responsibilities
Sets `lifetime = 300` and `radius = 20` for the Step event.

## Inputs and outputs
Writes trap configuration fields and returns nothing.

## Relationships
Paired with the trap Step event, which checks enemies and uses damage behavior.

## Learning concepts
A radius defines an area around a point. Lifetime controls how long an object remains.

## Known notes
The trap's values are direct configuration fields rather than a separate definition struct.
