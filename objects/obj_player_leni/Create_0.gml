// =============================================================================
// OBJECT:      obj_player_leni
// EVENT:       Create
// SYSTEM:      Leni Configuration
// =============================================================================

event_inherited();

/// =========================
/// SPRITES
/// =========================

sprite[FACE.RIGHT] = spr_player_right_leni;
sprite[FACE.UP]    = spr_player_up_leni;
sprite[FACE.LEFT]  = spr_player_left_leni;
sprite[FACE.DOWN]  = spr_player_down_leni;

/// =========================================================
/// MOVEMENT STATS
/// =========================================================

acceleration = 0.28;
movement_damping = 0.06;
max_speed = move_speed;
impulse_decay = 0.55;
