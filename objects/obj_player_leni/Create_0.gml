// =============================================================================
// OBJECT:      obj_player_leni
// EVENT:       Create
// SYSTEM:      Leni Configuration
// =============================================================================

event_inherited();

/// =========================
/// SPRITES
/// =========================

sprite[0] = sPlayerRightGirl;
sprite[1] = sPlayerUpGirl;
sprite[2] = sPlayerLeftGirl;
sprite[3] = sPlayerDownGirl;

acceleration = 0.28;
movement_damping = 0.06;
max_speed = move_speed;
impulse_decay = 0.55;
