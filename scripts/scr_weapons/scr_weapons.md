# `scripts/scr_weapons/scr_weapons.gml`

## What it does
Creates centralized weapon definition structs and supplies weapon setup or selection data.

## When it runs
Weapon child Create events call `Weapon_Create`; player and weapon runtime events read the returned values.

## Important responsibilities
It maps weapon types to names, sprites, projectile objects, rates, damage, and other tuning values.

## Inputs and outputs
`Weapon_Create(_type)` receives a `WEAPON` enum value and returns a definition struct. Callers copy or read its fields.

## Relationships
`obj_weapon` is the shared parent; bow, boomerang, magic staff, shotgun, and slingshot children choose a definition. Player code uses the equipped weapon.

## Learning concepts
Centralized data keeps related objects consistent. A projectile is a separate object created by a weapon when it fires.

## Known notes
Child objects remain intentionally small because this script owns shared weapon configuration.
