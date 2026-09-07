// ===========================================================================
// OBJECT:       obj_projectile_arrow
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Projectile Arrow Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures an arrow's speed, direction, damage, range, origin, owner, and sprite after inherited projectile setup.
//
// ===========================================================================

event_inherited();

speed = 0.01;
direction = 0;
damage = 5;

start_x = x;
start_y = y;

vx = 0;
vy = 0;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
