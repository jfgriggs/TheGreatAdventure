// =============================================================================
// OBJECT:      obj_player_ben
// EVENT:       Create
// SYSTEM:      Ben Configuration
// =============================================================================

event_inherited();

/// =========================
/// SPRITES
/// =========================

sprite[0] = sPlayerRightBoy;
sprite[1] = sPlayerUpBoy;
sprite[2] = sPlayerLeftBoy;
sprite[3] = sPlayerDownBoy;

/// =========================================================
/// MOVEMENT STATS
/// =========================================================

acceleration = 0.32;
friction = 0.04;
max_speed = move_speed;
impulse_decay = 0.55;
