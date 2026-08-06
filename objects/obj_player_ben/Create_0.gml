// =============================================================================
// OBJECT:      obj_player_ben
// EVENT:       Create
// SYSTEM:      Ben Configuration
// =============================================================================

event_inherited();

/// =========================
/// SPRITES
/// =========================

sprite[FACE.RIGHT] = spr_player_right_ben;
sprite[FACE.UP]    = spr_player_up_ben;
sprite[FACE.LEFT]  = spr_player_left_ben;
sprite[FACE.DOWN]  = spr_player_down_ben;

/// =========================================================
/// MOVEMENT STATS
/// =========================================================

acceleration = 0.32;
movement_damping = 0.04;
max_speed = move_speed;
impulse_decay = 0.55;
