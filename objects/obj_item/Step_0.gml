// File: obj_item.gml
// Event: step

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
    // Limit inventory size
    if (ds_list_size(p.inventory) > 6) return;

    // Add to inventory
    ds_list_add(p.inventory, item);

    // Auto-select newest item
    p.active_item_index = ds_list_size(p.inventory) - 1;
    p.active_item = p.inventory[| p.active_item_index];

    // OPTIONAL: prevent duplicates
    /*
    if (ds_list_find_index(p.inventory, item_type) == -1) {
        ds_list_add(p.inventory, Item_Create(item_type));
    }
    */

    // =========================
    // FEEDBACK (OPTIONAL)
    // =========================

    // Sound
    audio_play_sound(snd_item_pickup, 1, false);

    // Visual effect
    effect_create_layer("Effects", ef_spark, x, y, 1, c_yellow);

    // =========================
    // REMOVE ITEM
    // =========================
    instance_destroy();
}