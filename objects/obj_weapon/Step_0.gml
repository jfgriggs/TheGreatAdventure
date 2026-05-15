// =============================================================================
// OBJECT:      obj_weapon
// EVENT:       Step
// SYSTEM:      Weapon Pickup Runtime Update
// =============================================================================

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

if (!instance_exists(p)) {
    exit;
}


/// =========================
/// PICKUP DISTANCE
/// =========================

if (point_distance(x, y, p.x, p.y) < pickup_radius) {

    /// =========================
    /// WEAPON LIMIT
    /// =========================

    if (ds_list_size(p.weapons) >= 6) {
        exit;
    }


    /// =========================
    /// DUPLICATE CHECK
    /// =========================

    var already_owned = false;

    for (var i = 0; i < ds_list_size(p.weapons); i++) {

        var w = p.weapons[| i];

        if (w.weapon_id == weapon_type) {
            already_owned = true;
            break;
        }
    }


    /// =========================
    /// ADD WEAPON
    /// =========================

    if (!already_owned) {

        ds_list_add(
            p.weapons,
            weapon
        );

        // Auto-select newest weapon
        p.active_weapon_index = ds_list_size(p.weapons) - 1;

        p.active_weapon = p.weapons[| p.active_weapon_index];

        // Sound
        audio_play_sound(
            snd_weapon_pickup,
            1,
            false
        );

        // Visual Effect
        effect_create_layer(
            "Effects",
            ef_spark,
            x,
            y,
            1,
            c_yellow
        );
    }


    /// =========================
    /// REMOVE WORLD PICKUP
    /// =========================

    instance_destroy();
}