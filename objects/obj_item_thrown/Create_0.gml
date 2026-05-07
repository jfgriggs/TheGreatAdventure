// =============================================================================
// OBJECT:      obj_item_thrown
// EVENT:       Create
// SYSTEM:      Thrown Item Initialization
// =============================================================================

/// @description Initializes thrown-item runtime behavior, physics, movement variables, and interaction state.
///
/// Responsibilities:
/// - Initialize thrown item data
/// - Configure movement physics
/// - Setup drag/deceleration
/// - Configure collision behavior
/// - Initialize terrain interaction
/// - Setup ownership/source references
/// - Configure lifetime/timers
///
/// Notes:
/// - Thrown item properties should remain data-driven
/// - Shared movement logic belongs in scr_movement
/// - Item definitions belong in scr_items
/// - Avoid hardcoding vegetable-specific behavior here


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