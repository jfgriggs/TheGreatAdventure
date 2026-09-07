# `objects/obj_enemy/Step_0.gml`

## What it does
Runs shared enemy runtime updates, including game-state gating, invincibility countdown, knockback, and death-related behavior.

## When it runs
Once per frame for enemy instances.

## Important responsibilities
Applies common damage response and updates fields needed by child enemy behavior.

## Inputs and outputs
Reads `global.game_state`, health, invincibility, and knockback fields; mutates timers, position, and enemy state.

## Relationships
Parent runtime for archer, bear, hunter, and wolf. Child Step events add their own behavior.

## Learning concepts
A parent event can establish common rules before or alongside child behavior.

## Known notes
The enemy family uses legacy movement fields and update paths unlike players and animals.
