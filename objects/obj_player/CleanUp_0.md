# `objects/obj_player/CleanUp_0.gml`

## What it does
Releases player-owned runtime resources when the player instance is destroyed.

## When it runs
When a player instance is removed or its room is closed.

## Important responsibilities
Cleans up resources created by player initialization, such as inventory structures or related handles, according to ownership.

## Inputs and outputs
Reads player-owned resource fields and releases them; returns nothing.

## Relationships
Complements `obj_player` Create and protects shared systems from leaked player resources.

## Learning concepts
A resource lifetime begins at creation and ends at cleanup. Cleanup belongs with the owner.

## Known notes
Resources owned by the controller or shared scripts are not the player's responsibility.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
