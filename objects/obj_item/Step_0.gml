// =============================================================================
// OBJECT:      obj_item
// EVENT:       Step
// SYSTEM:      Item Runtime Update
// =============================================================================

/// @description Updates item runtime behavior and interaction logic.
///
/// Child Objects:
/// - obj_item_carrot
/// - obj_item_corn
/// - obj_item_*
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
/// - Shared item systems should remain centralized
/// - Terrain behavior should route through shared systems
/// - Avoid duplicating interaction logic across item types

// If game not playing stop
if (global.game_state != GAME_STATE.PLAYING) {
    exit;
}

/// =========================
/// BOB ANIMATION
/// =========================
bob_phase += bob_speed;

y = base_y + sin(bob_phase) * bob_amplitude;

life--;

// =========================
// REMOVE ITEM if life reaches 0
// =========================
if (life == 0) {
    instance_destroy();
	exit;
}

/// =========================
/// PLAYER PICKUP
/// =========================
var p = global.player_object;

if (!instance_exists(p)) exit;

// Distance check
if (point_distance(x, y, p.x, p.y) < pickup_radius) {
    // Add to inventory
    Inventory_Add_Item(p, item);
    
    // =========================
    // FEEDBACK
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