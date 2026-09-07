# `objects/obj_garden_eggplant/Create_0.gml`

## What it does
Configures an eggplant plant with `ITEM.EGGPLANT`, its garden sprite, and pickup sound after inherited setup.

## When it runs
When an eggplant plant is created.

## Important responsibilities
Selects the item and visuals; the parent handles growth and harvesting.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
Child configuration and parent behavior can be kept separate.

## Known notes
Simple configuration-only event using `event_inherited()`.
