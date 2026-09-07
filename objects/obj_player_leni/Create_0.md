# `objects/obj_player_leni/Create_0.gml`

## What it does
Configures the player as Leni and then uses the shared player initialization.

## When it runs
When the Leni player instance is created.

## Important responsibilities
Sets Leni-specific identity or presentation fields; the parent owns common gameplay setup.

## Inputs and outputs
Writes character configuration and returns nothing.

## Relationships
Child of `obj_player`; depends on inherited player fields and states.

## Learning concepts
Specialization changes selected data without duplicating shared behavior.

## Known notes
Configuration-focused child Create event using `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
