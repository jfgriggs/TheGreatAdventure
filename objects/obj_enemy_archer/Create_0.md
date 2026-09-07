# `objects/obj_enemy_archer/Create_0.gml`

## What it does
Configures an archer with health, vision and attack ranges, fire timing, projectile object, inventory, and sprite set after inherited setup.

## When it runs
When an archer is created.

## Important responsibilities
Provides ranged-enemy tuning and selects `obj_projectile_arrow` as its projectile.

## Inputs and outputs
Writes `enemy_type`, `hp_max`, `hp`, ranges, `attack_damage`, `attack_rate`, `projectile_object`, and sprite fields.

## Relationships
Child of `obj_enemy`; uses archer states, damage, inventory, and arrow projectile code.

## Learning concepts
Configuration values tune behavior without changing the shared enemy framework.

## Known notes
The enemy's movement path is legacy and is retained as observed.
