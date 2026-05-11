// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Step
// SYSTEM:      Weapon Runtime Update
// =============================================================================

/// @description Updates weapon runtime behavior and interaction logic.
///
/// Child Objects:
/// - obj_weapon_slignshot
/// - obj_weapon_shotgun
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
var p = global.player_object;

if (!instance_exists(p)) exit;

// Distance check
if (point_distance(x, y, p.x, p.y) < pickup_radius) {
    // =========================
    // WEAPON LIMIT
    // =========================
    if (ds_list_size(p.weapons) >= 6) return;

    // =========================
    // DUPLICATE CHECK
    // =========================
    var already_owned = false;

    for (var i = 0; i < ds_list_size(p.weapons); i++) {
        var w = p.weapons[| i];
        if (w.weapon_id == weapon_type) {
            already_owned = true;
            break;
        }
    }

    // =========================
    // ADD WEAPON
    // =========================
    if (!already_owned) {
        ds_list_add(p.weapons, Weapon_Create(weapon_type));

        // Auto-select newest weapon
        p.active_weapon_index = ds_list_size(p.weapons) - 1;
        p.active_weapon = p.weapons[| p.active_weapon_index];

        // Sound
        audio_play_sound(snd_weapon_pickup, 1, false);

        // Visual effect
	    effect_create_layer("Effects", ef_spark, x, y, 1, c_yellow);
    }

    // =========================
    // REMOVE weapon
    // =========================
    instance_destroy();
}