// File: obj_item.gml
// Event: create

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