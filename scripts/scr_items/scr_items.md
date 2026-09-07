# `scripts/scr_items/scr_items.gml`

## What it does
Creates item definition structs and provides item damage, inventory, and throwing helpers.

## When it runs
Item Create events call `Item_Create`; item, player, and thrown-item events call the interaction helpers during play.

## Important responsibilities
It assigns vegetable identity, sprite, life, health, throw properties, and handles taking damage, destroying damaged items, inventory transfer, and item throwing.

## Inputs and outputs
`Item_Create(_type)` returns a definition struct. Other functions receive an item or owner instance and mutate inventory or item runtime state.

## Relationships
`obj_item` and its vegetable children consume the definitions. `obj_item_thrown`, players, and weapon logic depend on this script.

## Learning concepts
A struct is a small named data package. A factory function creates consistent packages from a type name.

## Known notes
The source retains a legacy `variable_instance_exists()` check when validating item instances.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
