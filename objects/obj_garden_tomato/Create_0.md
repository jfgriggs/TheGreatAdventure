# `objects/obj_garden_tomato/Create_0.gml`

## What it does
Configures a tomato plant with `ITEM.TOMATO`, its garden sprite, and pickup sound after inherited setup.

## When it runs
When a tomato plant is created.

## Important responsibilities
Selects tomato identity and visuals; shared plant code grows and harvests it.

## Inputs and outputs
Writes `item_type`, `sprite_index`, and `harvest_sound`.

## Relationships
Child of `obj_garden_plant`.

## Learning concepts
A child supplies settings and the parent supplies the reusable lifecycle.

## Known notes
Configuration-only Create event using `event_inherited()`.
