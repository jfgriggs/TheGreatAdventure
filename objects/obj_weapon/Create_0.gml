// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Create
// SYSTEM:      Weapon Pickup Initialization
// =============================================================================

/// @description Shared weapon pickup runtime initialization.
///
/// Responsibilities:
/// - Shared pickup behavior
/// - Shared runtime state
/// - Shared bob animation
/// - Shared world interaction behavior
///
/// Notes:
/// - Weapon definitions remain data-driven
/// - Inventory payloads use Weapon_Create()
/// - Shared combat logic belongs in scr_weapons


/// =========================
/// WEAPON DATA
/// =========================

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