# `objects/obj_ui/Draw_64.gml`

## What it does
Draws the UI overlay elements handled by the base UI object when the expected player or other instance is present.

## When it runs
During the GUI drawing phase each frame.

## Important responsibilities
Presents screen-space interface information and avoids reading missing instances.

## Inputs and outputs
Reads UI and player state and draws interface pixels; it returns no value.

## Relationships
Works alongside `obj_hud`; depends on player existence and shared game state.

## Learning concepts
An existence check prevents code from using an object that has already been removed. UI is presentation rather than simulation.

## Known notes
The event begins by checking for a player before drawing dependent information.
