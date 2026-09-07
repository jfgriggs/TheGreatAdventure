# `rooms/RoomInitialize/RoomCreationCode.gml`

## What it does
Runs the room's one-time creation setup for the initialization room, preparing the game before the main play room begins.

## When it runs
GameMaker runs Room Creation Code when `RoomInitialize` is created.

## Important responsibilities
It performs room-level startup work and connects initialization to the controller and global setup used by gameplay.

## Inputs and outputs
It reads project resources and startup values and changes global or room initialization state. It has no normal function parameters or return value.

## Relationships
This code works with `obj_controller` and `scr_globals`. The room itself is a container, not a parent object.

## Learning concepts
Room Creation Code is a special event attached to a room. An event is code that runs because a game moment happened.

## Known notes
The exact order of startup is important: controller-owned resources and global values must exist before gameplay objects use them.
