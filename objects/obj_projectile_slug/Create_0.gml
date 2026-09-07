// ===========================================================================
// OBJECT:       obj_projectile_slug
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Projectile Slug Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes a slug with speed, direction, damage, maximum travel distance, and origin after inherited setup.
//
// ===========================================================================

event_inherited();

speed = 1;
direction = 0;
damage = 5;
max_distance = 100;

start_x = x;
start_y = y;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
