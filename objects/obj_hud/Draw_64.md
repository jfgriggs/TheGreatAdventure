# `objects/obj_hud/Draw_64.gml`

## What it does
Draws the GUI: game timer, points, inventory, animal counts or goals, weapon information, and state-dependent HUD panels.

## When it runs
During the GUI drawing phase each frame.

## Important responsibilities
Reads gameplay state and presents it in screen coordinates without controlling the underlying systems.

## Inputs and outputs
Reads `global.game_state`, `global.game_time`, player inventory and weapons, controller data, and animal fields; draws text and panels.

## Relationships
Depends on `obj_player`, `obj_controller`, animals, weapons, and HUD helper functions from Create.

## Learning concepts
A HUD is an observer: it reports state owned by other objects. GUI coordinates stay fixed to the screen while the world moves.

## Known notes
It formats seconds with leading zeroes and handles missing instances before reading them.
