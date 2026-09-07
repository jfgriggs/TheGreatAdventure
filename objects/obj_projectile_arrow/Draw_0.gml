// ===========================================================================
// OBJECT:       obj_projectile_arrow
// EVENT:        Draw
// REVISION:     1.0.0
// SYSTEM:       Projectile Arrow Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Draws the arrow with visual orientation matching its flight direction.
//
// ===========================================================================

image_angle = point_direction(0, 0, vx, vy);

/// =========================
/// DRAW
/// =========================
draw_self();

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
