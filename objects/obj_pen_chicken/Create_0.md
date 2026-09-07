# `objects/obj_pen_chicken/Create_0.gml`

## What it does
Configures the pen to accept chickens by calling inherited setup and setting `accepted_animal = ANIMAL.CHICKEN`.

## When it runs
When a chicken pen is created.

## Important responsibilities
Selects the accepted animal; shared pen code owns any common behavior.

## Inputs and outputs
Writes `accepted_animal`; no parameters or return value.

## Relationships
Child of `obj_pen`; uses its `score_value` configuration.

## Learning concepts
A child configuration value tells shared code which type it should recognize.

## Known notes
Simple configuration-only Create event using `event_inherited()`.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
