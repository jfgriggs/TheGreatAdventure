# `objects/obj_garden_plant/Step_0.gml`

## What it does
Advances plant growth and lets a nearby player harvest a fruiting plant into inventory.

## When it runs
It runs once per frame for each plant while gameplay is active.

## Important responsibilities
It counts down growth, moves through sprout, young, fruiting, and harvested stages, checks pickup distance, adds the item, plays the harvest sound, and restarts growth.

## Inputs and outputs
It reads `growth_timer`, `image_index`, `item_type`, and the player. It changes growth fields and may add an item to the player's inventory.

## Relationships
Child plant Create events configure the item and sprite. It depends on `scr_items` inventory logic and the player object.

## Learning concepts
A stage sequence is a simple state machine. A collision or radius query checks whether two things are close enough to interact.

## Known notes
Harvesting only happens in the fruiting stage; failed inventory insertion does not mark the plant harvested.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
