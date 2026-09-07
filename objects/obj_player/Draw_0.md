# `objects/obj_player/Draw_0.gml`

## What it does
Draws the player's current sprite and presentation state, including direction or status effects selected during gameplay.

## When it runs
During the player's world Draw event.

## Important responsibilities
Renders the player at its world position and keeps visual work separate from behavior updates.

## Inputs and outputs
Reads sprite, image, position, and status fields and produces screen output.

## Relationships
Inherited by Ben and Leni unless overridden; follows values set by player Step and character configuration.

## Learning concepts
A Draw event displays state; it normally does not decide the state.

## Known notes
Depth and visual choices depend on the player fields initialized by the parent and child.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
