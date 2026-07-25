// =============================================================================
// OBJECT:      obj_player_leni
// EVENT:       Create
// SYSTEM:      Leni Configuration
// =============================================================================

event_inherited();

/// =========================
/// SPRITES
/// =========================

sprite[0] = spr_player_right_leni;
sprite[1] = spr_player_up_leni;
sprite[2] = spr_player_left_leni;
sprite[3] = spr_player_down_leni;

acceleration = 0.28;
movement_damping = 0.06;
max_speed = move_speed;
impulse_decay = 0.55;
