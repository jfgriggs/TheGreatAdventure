# `objects/oTreeParent/Step_0.gml`

## What it does
Runs shared per-frame behavior for the legacy tree parent, including its world interaction or presentation state.

## When it runs
Once per frame for tree instances using this parent.

## Important responsibilities
Maintains behavior shared by the many tree variants without duplicating it in each tree object.

## Inputs and outputs
Reads tree instance and nearby world fields and changes only the runtime values controlled by this event.

## Relationships
Parent for legacy tree variants such as flower, fruit, maple, moss, pine, willow, and regular trees.

## Learning concepts
A parent object is a reusable base. Legacy naming can remain compatible while behavior is shared.

## Known notes
The `oTree...` naming is an older project convention.

## Documentation migration
The matching GML file now uses the canonical project header and revision history. Function comments identify inputs and outputs where the file defines functions. This migration changes comments only; executable behavior is unchanged.
