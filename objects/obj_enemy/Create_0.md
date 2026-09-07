# `objects/obj_enemy/Create_0.gml`

## What it does
Initializes shared enemy health, damage response, target and movement fields, and enemy runtime state.

## When it runs
When an enemy instance is created.

## Important responsibilities
Prepares common combat and behavior fields consumed by enemy states and the enemy Step event.

## Inputs and outputs
Reads child configuration and writes health, invincibility, knockback, target, and state-machine fields.

## Relationships
Parent of archer, bear, hunter, and wolf. Depends on damage, enemy states, and global game state.

## Learning concepts
Parent behavior can support different children. A target is another instance an enemy is deciding how to interact with.

## Known notes
Enemy movement setup differs from the shared player and animal movement contract.
