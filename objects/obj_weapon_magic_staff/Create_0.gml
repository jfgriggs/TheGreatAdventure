// ===========================================================================
// OBJECT:       obj_weapon_magic_staff
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Weapon Magic Staff Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a magic staff weapon with its enum type, definition, sprite, and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// WEAPON DEFINITION
/// =========================

weapon_type = WEAPON.MAGIC_STAFF;

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
