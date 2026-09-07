# `objects/obj_player_ben/Create_0.gml`

## What it does
Configures the player as Ben, supplying character-specific sprite or tuning values and inheriting shared player setup.

## When it runs
When the Ben player instance is created.

## Important responsibilities
Identifies the playable character while leaving movement, inventory, combat, and state behavior to the parent.

## Inputs and outputs
Writes Ben-specific configuration fields and has no parameters or return value.

## Relationships
Child of `obj_player`; uses parent initialization and player state scripts.

## Learning concepts
A child object is a specialized version of a parent object.

## Known notes
This is primarily a configuration and presentation event that calls `event_inherited()`.
