# `scripts/scr_animals/scr_animals.gml`

## What it does
Defines animal data and helper functions for creating animal definitions and handling animal-specific behavior.

## When it runs
Animal objects and animal states call these functions during creation and gameplay updates.

## Important responsibilities
It centralizes animal types, configuration, habitat or safety information, and reusable animal operations instead of placing species rules in every child.

## Inputs and outputs
Functions receive an animal type or animal instance and return or update animal data structs and runtime fields.

## Relationships
`obj_animal` owns shared runtime behavior; chicken, cow, pig, and sheep children select concrete configuration. Animal states and tile queries depend on this script.

## Learning concepts
A data definition is a bundle of related values. A child object can specialize a parent without copying all of its behavior.

## Known notes
The exact species behavior is data-driven; this file should be read with the animal parent and state script that consume its definitions.
