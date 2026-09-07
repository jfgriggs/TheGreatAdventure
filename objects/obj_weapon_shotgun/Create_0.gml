// ===========================================================================
// OBJECT:       obj_weapon_shotgun
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Shotgun Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a shotgun weapon through its centralized definition and inherited weapon setup.
//
// ===========================================================================

event_inherited();

/// =========================
/// WEAPON DEFINITION
/// =========================

weapon_type = WEAPON.SHOTGUN;

weapon = Weapon_Create(weapon_type);

/// =========================
/// VISUALS
/// =========================

sprite_index = weapon.sprite;
mask_index = weapon.sprite;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
