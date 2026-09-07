# `objects/obj_camera/Step_2.gml`

## What it does
Updates the camera in the later Step event so the view follows the game's current camera target or limits.

## When it runs
Once per frame during Step 2.

## Important responsibilities
Performs camera movement or view maintenance after earlier game updates.

## Inputs and outputs
Reads camera and player/controller positions and changes camera view state.

## Relationships
Works with `obj_controller` and the player; it is a utility object rather than a parent/child gameplay type.

## Learning concepts
A camera changes what part of the room the player can see. Update order affects what position it follows.

## Known notes
This source is a late-step camera event; its exact behavior depends on the camera fields created elsewhere.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
