# `objects/obj_controller/CleanUp_0.gml`

## What it does
Releases runtime resources created and owned by the controller when it is removed.

## When it runs
GameMaker runs this Cleanup event when the controller instance is destroyed or the room ends.

## Important responsibilities
Pairs controller resource creation with cleanup so particle, map, audio, or other handles do not remain allocated.

## Inputs and outputs
It reads controller-owned resource fields and releases them; it has no return value.

## Relationships
Complements `Create_0.gml` and protects systems that depend on `global.controller`.

## Learning concepts
Cleanup is the closing step for a resource's lifetime. The creator should normally be its releaser.

## Known notes
Only resources owned by the controller should be released here.
