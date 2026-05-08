// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Create
// SYSTEM:      weapon Initialization
// =============================================================================

/// @description Initializes weapon instance data, runtime variables, interaction behavior, and weapon configuration.
///
/// Responsibilities:
/// - Initialize weapon data structs
/// - Configure pickup behavior
/// - Setup collision/interactions
/// - Configure physics/movement variables
/// - Initialize visual state
/// - Setup runtime ownership/reference data
///
/// Notes:
/// - weapon definitions should remain data-driven
/// - Shared weapon behavior belongs in scr_weapons
/// - Avoid hardcoding weapon-specific logic directly here

/// =========================
/// weapon SETUP
/// =========================

// What type of weapon this is
weapon = undefined;

// =========================
// BOB ANIMATION (POLISH)
// =========================
base_y = y;

bob_amplitude = 1;
bob_speed = 0.1;
bob_phase = random(1000);


// =========================
// PICKUP SETTINGS
// =========================
pickup_radius = 16;