// ===========================================================================
// OBJECT:       obj_weapon_bow
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Bow Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the weapon as WEAPON.BOW, creates its definition, and applies its sprite and mask after inherited setup.
//
// ===========================================================================

event_inherited();

/// =========================
/// WEAPON DEFINITION
/// =========================

weapon_type = WEAPON.BOW;

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
