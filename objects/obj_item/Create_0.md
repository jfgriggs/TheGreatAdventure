# `objects/obj_item/Create_0.gml`

## What it does
Initializes the shared item instance with item data, health, life, movement, pickup, and interaction fields.

## When it runs
When any item instance is created, before its Step event.

## Important responsibilities
It prepares the item for being picked up, damaged, thrown, and destroyed, and establishes movement values used by item motion.

## Inputs and outputs
It reads the child-selected `item_type` and creates or uses an item definition. It writes fields including `item`, `hp`, `max_hp`, `life`, and movement values.

## Relationships
Parent of vegetable item children and used by `obj_item_thrown`. It depends on `scr_items` and shared tile queries.

## Learning concepts
Shared initialization is placed in a parent so children do not duplicate it. Runtime fields describe the changing copy of an item.

## Known notes
Child item types are selected through inherited setup and centralized item definitions.
