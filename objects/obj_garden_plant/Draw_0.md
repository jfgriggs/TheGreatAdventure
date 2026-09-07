# `objects/obj_garden_plant/Draw_0.gml`

## What it does
Draws the plant using its current sprite and growth image so its visual stage is visible in the room.

## When it runs
GameMaker calls it during the Draw event for each plant.

## Important responsibilities
It presents the growth state selected by the Step event without changing plant logic.

## Inputs and outputs
It reads plant position, sprite, and image fields and draws them to the screen.

## Relationships
Used by `obj_garden_plant` and its vegetable children; growth data comes from `Step_0`.

## Learning concepts
Rendering turns stored game data into a picture. Keeping Draw separate makes behavior easier to follow.

## Known notes
The exact appearance comes from the child sprite configuration.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
