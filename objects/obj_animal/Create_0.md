# `objects/obj_animal/Create_0.gml`

## What it does
Initializes the shared animal instance: definition data, movement fields, safety checks, health, sprite settings, and a state machine.

## When it runs
GameMaker runs this Create event when any `obj_animal` instance is created, before its later Step and Draw events.

## Important responsibilities
It establishes the fields used by animal states, shared movement, tile habitat checks, and animation.

## Inputs and outputs
It reads the child-selected `animal_type` and creates animal runtime data. It writes fields such as `animal_data`, movement values, `is_safe`, and `sm`.

## Relationships
This is the parent for chicken, cow, pig, and sheep objects. It depends on `scr_animals`, `scr_movement`, `scr_tiles`, and state scripts.

## Learning concepts
A parent object holds behavior shared by children. Initialization prepares fields before other events use them.

## Known notes
Child Create events must configure their type at the point expected by inherited setup; species behavior is intentionally shared and data-driven.
