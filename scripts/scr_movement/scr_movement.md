# `scripts/scr_movement/scr_movement.gml`

## What it does
Provides shared movement helpers, including `Movement_Update`, which applies input, acceleration, speed limits, impulses, damping, tile checks, and position changes.

## When it runs
Moving instances call the helper from their Step logic while the game is playing.

## Important responsibilities
It combines movement intent with external impulses, limits effective speed, checks blocking and safe tiles, and updates velocity and coordinates.

## Inputs and outputs
`Movement_Update(_inst)` receives an instance with movement fields such as `move_input_x`, `move_input_y`, `velocity_x`, `velocity_y`, `max_speed`, and tile-check functions. It mutates that instance's velocity and position.

## Relationships
Players and animals use this shared subsystem. Tile functions from `scr_tiles` are dependencies; the helper is not a parent object.

## Learning concepts
A helper function is reusable code. A dependency is another system a piece of code needs, such as a tile query for collision.

## Known notes
The source contains the project's shared movement contract, including optional safe-area checks and impulses. Objects outside this contract may use different legacy fields.
