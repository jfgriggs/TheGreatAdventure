# `objects/obj_enemy_hunter/Create_0.gml`

## What it does
Initializes hunter-specific speed, vision and attack ranges, fire rate, health, invincibility, knockback, and local movement function.

## When it runs
When a hunter enemy is created.

## Important responsibilities
Supplies the tuning and runtime fields used by hunter behavior and damage response.

## Inputs and outputs
Writes `speed`, `vision_range`, `attack_range`, `fire_rate`, `hp`, `iframes`, knockback fields, and `apply_movement`.

## Relationships
Uses the enemy hierarchy and state-machine behavior, plus damage and player targeting systems.

## Learning concepts
A local function can act as a method for one instance. Tuning fields change behavior without changing the state system.

## Known notes
Hunter movement follows the enemy family's unusual legacy pattern.
