// ===========================================================================
// OBJECT:       obj_projectile
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Projectile Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes shared projectile fields such as speed, direction, damage, range, origin, owner, and lifetime.
//
// ===========================================================================

owner = noone;

// --------------------------------------------------
// Damage
// --------------------------------------------------

damage = 1;

// --------------------------------------------------
// Movement
// --------------------------------------------------

speed = 0;

direction = 0;

vx = 0;
vy = 0;

// --------------------------------------------------
// Lifetime
// --------------------------------------------------

max_distance = 0;

distance_traveled = 0;

destroy_on_hit = true;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
