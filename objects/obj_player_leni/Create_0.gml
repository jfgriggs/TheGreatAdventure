// ===========================================================================
// OBJECT:       obj_player_leni
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Player Leni Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the player as Leni and then uses the shared player initialization.
//
// ===========================================================================

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
