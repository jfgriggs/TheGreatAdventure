// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Step
// SYSTEM:      weapon Runtime Update
// =============================================================================

/// @description Updates weapon runtime behavior and interaction logic.
///
/// Child Objects:
/// - obj_weapon_carrot
/// - obj_weapon_corn
/// - obj_weapon_*
///
/// Responsibilities:
/// - Handle pickup detection
/// - Update movement/physics behavior
/// - Process interaction logic
/// - Update timers/effects
/// - Handle terrain interaction
/// - Update visual state
///
/// Notes:
/// - Shared weapon systems should remain centralized
/// - Terrain behavior should route through shared systems
/// - Avoid duplicating interaction logic across weapon types

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
    exit;
}

/// =========================
/// BOB ANIMATION
/// =========================
bob_phase += bob_speed;

y = base_y + sin(bob_phase) * bob_amplitude;


/// =========================
/// PLAYER PICKUP
/// =========================
var p = obj_player;

if (!instance_exists(p)) exit;

// Distance check
if (point_distance(x, y, p.x, p.y) < pickup_radius) {
    // Limit weapons size
    if (ds_list_size(p.weapons) > 6) return;

    // Add to weapons
    ds_list_add(p.weapons, weapon);

    // Auto-select newest weapon
    p.active_weapon_index = ds_list_size(p.weapons) - 1;
    p.active_weapon = p.weapons[| p.active_weapon_index];

    // OPTIONAL: prevent duplicates
    if (ds_list_find_index(p.weapons, weapon_type) == -1) {
        ds_list_add(p.weapons, weapon_Create(weapon_type));
    }

    // =========================
    // FEEDBACK (OPTIONAL)
    // =========================

    // Sound
    audio_play_sound(snd_weapon_pickup, 1, false);

    // Visual effect
    effect_create_layer("Effects", ef_spark, x, y, 1, c_yellow);

    // =========================
    // REMOVE weapon
    // =========================
    instance_destroy();
}