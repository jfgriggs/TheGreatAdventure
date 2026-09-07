// ===========================================================================
// OBJECT:       obj_weapon
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes the shared weapon instance and its default runtime fields before a concrete weapon selects a definition.
//
// ===========================================================================

weapon = undefined;
weapon_type = -1;

/// =========================
/// PICKUP
/// =========================

pickup_radius = 16;

/// =========================
/// BOB ANIMATION
/// =========================

base_y = y;

bob_amplitude = 1;
bob_speed = 0.1;
bob_phase = random(1000);

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
