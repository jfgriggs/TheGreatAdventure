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

// -----------------------------------------------------------------------------
// Facing Direction
// -----------------------------------------------------------------------------

enum FACE {
    UP,
    RIGHT,
    DOWN,
    LEFT,
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