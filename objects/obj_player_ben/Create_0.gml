// ===========================================================================
// OBJECT:       obj_player_ben
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Player Ben Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the player as Ben, supplying character-specific sprite or tuning values and inheriting shared player setup.
//
// ===========================================================================

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
