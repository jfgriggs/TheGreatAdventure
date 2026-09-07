// ===========================================================================
// OBJECT:       obj_projectile_pellets
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Projectile Pellets Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes a pellet projectile with speed, direction, damage, maximum distance, and origin.
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
