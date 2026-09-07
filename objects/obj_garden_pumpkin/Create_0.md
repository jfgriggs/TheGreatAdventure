# `objects/obj_garden_pumpkin/Create_0.gml`

## What it does
Configures a plant to grow pumpkins by selecting `ITEM.PUMPKIN`, the pumpkin garden sprite, and pickup sound.

## When it runs
When a pumpkin plant is created.

## Important responsibilities
Supplies pumpkin-specific configuration while inheriting growth behavior.

## Inputs and outputs
Writes item and visual fields; no parameters or return value.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
Small child events are configuration layers over shared parent behavior.

## Known notes
Calls `event_inherited()`; no separate growth algorithm is present.
