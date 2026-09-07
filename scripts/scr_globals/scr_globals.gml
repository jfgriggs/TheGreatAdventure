// ===========================================================================
// SCRIPT:       scr_globals
// REVISION:     1.1.0
// SYSTEM:       Globals System
// ARCHITECTURE: Shared Globals System
//
// DESCRIPTION:
// Defines shared enums and Globals_Initialize(), which sets the starting game state, timing, score, player object, and spawn position.
//
// ===========================================================================

/// @function Globals_Initialize
/// @description Handles globals initialize for this file's subsystem.
/// @returns {void} The result of the operation, when it produces one.
function Globals_Initialize()
{
	
    // -------------------------------------------------------------------------
    // Game Configuration
    // -------------------------------------------------------------------------

	global.tile_size = 16;
    global.target_fps = game_get_speed(gamespeed_fps);

    // -------------------------------------------------------------------------
    // Player Configuration
    // -------------------------------------------------------------------------

    global.player_object = obj_player_ben;

    // -------------------------------------------------------------------------
    // New Game State
    // -------------------------------------------------------------------------
    
	// If game_state already exists globally then do not reset.
	// Allows Game_Reset() to preserve state correctly.
	if (!variable_global_exists("game_state"))
	{
	    global.game_state = GAME_STATE.STARTING;
	}

	global.game_time = 0;
    global.points = 0;
    global.best_time = 0;

    global.player_spawn_x = 1000;
    global.player_spawn_y = 250;
}


// -----------------------------------------------------------------------------
// Facing Direction
// -----------------------------------------------------------------------------

enum FACE {
    RIGHT,
    UP,
    LEFT,
	DOWN,
}

// -----------------------------------------------------------------------------
// Game States
// -----------------------------------------------------------------------------

enum GAME_STATE {
    STARTING,
    PLAYING,
    PAUSED,
    GAME_OVER,
}

// -----------------------------------------------------------------------------
// Animals
// -----------------------------------------------------------------------------

enum ANIMAL {
    NONE,
    CHICKEN,
    COW,
    PIG,
    SHEEP,
}

// -----------------------------------------------------------------------------
// Enemies
// -----------------------------------------------------------------------------

enum ENEMY {
    NONE,
    WOLF,
    BEAR,
    ARCHER,
    HUNTER,
}

// -----------------------------------------------------------------------------
// Factions
// -----------------------------------------------------------------------------

enum FACTION {
    NONE,
    PLAYER,
    ANIMAL,
    ENEMY,
    NEUTRAL,
}

// -----------------------------------------------------------------------------
// Items
// -----------------------------------------------------------------------------

enum ITEM {
    NONE,
    CABBAGE,
    CARROT,
    CORN,
    EGGPLANT,
    TOMATO,
    PEPPER,
    PUMPKIN,
    WATERMELON,
}

// -----------------------------------------------------------------------------
// Plant Growth Stages
// -----------------------------------------------------------------------------

enum PLANT_STAGE {
    SPROUT,
    YOUNG,
    FRUITING,
    HARVESTED,
}

// ---------------------------------------------------------------------------
// Revision History
// 1.1.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
