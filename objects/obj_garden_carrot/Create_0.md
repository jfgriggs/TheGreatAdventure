# `objects/obj_garden_carrot/Create_0.gml`

## What it does
Configures a plant to grow carrots, setting `ITEM.CARROT`, its garden sprite, and pickup sound after inherited setup.

## When it runs
When the carrot plant is created.

## Important responsibilities
Supplies carrot identity and presentation; shared growth and harvest remain in the parent.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`; no return value.

## Relationships
Child of `obj_garden_plant` and uses its Create, Step, and Draw events.

## Learning concepts
Inheritance shares behavior while configuration selects a concrete kind.

## Known notes
Configuration-only child event; it calls `event_inherited()`.
