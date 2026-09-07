// ===========================================================================
// OBJECT:       obj_item
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes the shared item instance with item data, health, life, movement, pickup, and interaction fields.
//
// ===========================================================================

item = undefined;
item_type = -1;

/// =========================
/// RUNTIME
/// =========================

life = -1;

vx = 0;
vy = 0;

base_y = y;

drag = 1;

/// =========================
/// PICKUP
/// =========================

pickup_radius = 16;

/// =========================
/// BOB ANIMATION
/// =========================

bob_amplitude = 1;
bob_speed = 0.1;
bob_phase = random(1000);

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
