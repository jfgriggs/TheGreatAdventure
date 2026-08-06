// =============================================================================
// SCRIPT:       scr_globals
// REVISION:     1.1.0
// SYSTEM:       Global Enums & Constants
// ARCHITECTURE: Shared Definitions
//
// DESCRIPTION:
// Defines project-wide enumerations and constants shared across multiple
// subsystems. This script intentionally contains identifiers only and should
// not contain runtime state or configuration data.
//
// =============================================================================

// -----------------------------------------------------------------------------
// Revision History
// -----------------------------------------------------------------------------
//
// 1.1.0
// • Standardized file header.
// • Added revision history.
// • Standardized section headers.
// • Clarified architecture responsibilities.
//
// 1.0.0
// • Initial implementation.
//

// =============================================================================
// World Constants
// =============================================================================


/// @function Globals_Initialize()
/// @description
/// Initializes game-wide global variables and constants. Safe to call once
/// during game startup.
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