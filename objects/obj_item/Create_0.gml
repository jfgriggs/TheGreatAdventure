// =============================================================================
// OBJECT:      obj_item
// EVENT:       Create
// SYSTEM:      Item Initialization
// =============================================================================

/// @description Initializes item instance data, runtime variables, interaction behavior, and item configuration.
///
/// Responsibilities:
/// - Initialize item data structs
/// - Configure pickup behavior
/// - Setup collision/interactions
/// - Configure physics/movement variables
/// - Initialize visual state
/// - Setup runtime ownership/reference data
///
/// Notes:
/// - Item definitions should remain data-driven
/// - Shared item behavior belongs in scr_items
/// - Avoid hardcoding item-specific logic directly here

/// =========================
/// ITEM SETUP
/// =========================

// What type of item this is
item = undefined;

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