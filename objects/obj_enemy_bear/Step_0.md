# `objects/obj_enemy_bear/Step_0.gml`

## What it does
Updates bear enemy state, invincibility, knockback, and predator movement during play.

## When it runs
Once per frame while the game is playing.

## Important responsibilities
Processes common damage response and executes bear behavior through its state machine.

## Inputs and outputs
Reads health, timers, knockback, target, and state fields; changes position and combat state.

## Relationships
Child of `obj_enemy`; uses predator states and inherited enemy logic.

## Learning concepts
A Step event repeatedly advances both decisions and physical effects.

## Known notes
Uses the enemy family's legacy movement fields rather than shared player/animal movement.
