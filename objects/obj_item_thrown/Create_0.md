# `objects/obj_item_thrown/Create_0.gml`

## What it does
Initializes an item that is flying after being thrown, including velocity, drag, distance tracking, owner, life, and damage.

## When it runs
When a thrown item instance is created by item-throwing logic.

## Important responsibilities
Stores the throw origin and movement values needed to limit travel and interact with terrain or targets.

## Inputs and outputs
It writes `vx`, `vy`, `drag`, `max_distance`, `start_x`, `start_y`, `life`, `owner`, and `damage`.

## Relationships
Child or specialized form of item behavior; `Step_0` moves it and `scr_items` creates it.

## Learning concepts
An owner reference records who launched or controls an object. Drag gradually reduces motion.

## Known notes
The source initializes defaults; the item definition is assigned when the object is populated.
