// ===========================================================================
// OBJECT:       obj_weapon_slingshot
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Slingshot Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a slingshot weapon with its selected definition and inherited weapon setup.
//
// ===========================================================================

event_inherited();

/// =========================
/// WEAPON DEFINITION
/// =========================

weapon_type = WEAPON.SLINGSHOT;

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
