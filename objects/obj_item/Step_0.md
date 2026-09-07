# `objects/obj_item/Step_0.gml`

## What it does
Updates item lifetime, movement, tile collision, and nearby pickup interactions.

## When it runs
Once per frame for each item while gameplay is active.

## Important responsibilities
It gates on the playing state, moves items, stops or redirects them at blocking tiles, counts life, and transfers an item to a nearby player when possible.

## Inputs and outputs
It reads `item`, movement fields, `life`, tile queries, and player instances. It changes position, velocity, life, and inventory ownership.

## Relationships
Parent runtime for item children; depends on `scr_items`, `scr_tiles`, and the player object.

## Learning concepts
Ownership means deciding which object currently controls a resource or item. Collision rules determine whether movement may continue.

## Known notes
Thrown items use a separate child object and can have different movement behavior.
