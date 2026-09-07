// ===========================================================================
// OBJECT:       obj_weapon_boomerang
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Boomerang Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the weapon as a boomerang using its centralized weapon definition and inherited setup.
//
// ===========================================================================

event_inherited();

/// =========================
/// WEAPON DEFINITION
/// =========================

weapon_type = WEAPON.BOOMERANG;

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
