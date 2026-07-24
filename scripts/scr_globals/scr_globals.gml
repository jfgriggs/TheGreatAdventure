// =============================================================================
// SCRIPT:      scr_globals
// SYSTEM:      Global Enums & Constants
// =============================================================================

/// =========================
/// GAME STATES
/// =========================

enum GAME_STATE {
	STARTING,
	PLAYING,
	PAUSED,
	GAME_OVER,
}

/// =========================
/// ANIMALS
/// =========================

enum ANIMAL {
	NONE,
	CHICKEN,
	COW,
	PIG,
	SHEEP,
}

/// =========================
/// ENEMIES
/// =========================

enum ENEMY {
	NONE,
	WOLF,
	BEAR,
	ARCHER,
	HUNTER,
}

/// =========================
/// ENEMIES
/// =========================

enum FACTION {
	NONE,
	PLAYER,
	ANIMAL,
	ENEMY,
	NEUTRAL,
}

/// =========================
/// ITEMS
/// =========================

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

enum PLANT_STAGE {
	SPROUT,
	YOUNG,
	FRUITING,
	HARVESTED,
}
