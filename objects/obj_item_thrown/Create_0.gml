// ===========================================================================
// OBJECT:       obj_item_thrown
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Thrown Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes an item that is flying after being thrown, including velocity, drag, distance tracking, owner, life, and damage.
//
// ===========================================================================

vx = 0;
vy = 0;

item = undefined;

// Defaults
drag = 0.96;
max_distance = 200;

start_x = x;
start_y = y;

// lifetime before becoming pickup
life = 60; // 1 second

// Owner (who threw it)
owner = noone;

// Damage
damage = 10;

// Lifetime after landing
life = 180; // 3 seconds

// State
landed = false;

// Sprite
sprite_index = spr_item_carrot; // default (will be overridden)

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
