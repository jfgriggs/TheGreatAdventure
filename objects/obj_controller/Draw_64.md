# `objects/obj_controller/Draw_64.gml`

## What it does
Draws controller-owned debug or world overlay information in the Draw GUI stage.

## When it runs
GameMaker calls it during the GUI drawing phase, after the room world is drawn.

## Important responsibilities
Presents controller state or debug information without changing gameplay simulation.

## Inputs and outputs
Reads controller and global values and draws screen-space information.

## Relationships
Belongs to `obj_controller`; HUD and UI may draw related information in their own events.

## Learning concepts
GUI drawing uses screen coordinates rather than world coordinates. Drawing should not secretly update game state.

## Known notes
The event's name indicates a GUI draw phase, not ordinary world rendering.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
