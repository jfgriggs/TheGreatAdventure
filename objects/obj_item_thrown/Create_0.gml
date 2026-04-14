// File: obj_item_thrown.gml
// Event: create

/// =========================
/// SETUP
/// =========================

// Horizontal movement
vx = 0;
vy = 0;

item = undefined;

// Defaults
drag = 0.96;
max_distance = 200;

start_x = x;
start_y = y;

// lifetime before becoming pickup
life = 60;   // 1 second

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