// =============================================================================
// OBJECT:      obj_weapon_boomerang
// EVENT:       Create
// SYSTEM:      Boomerang Configuration
// =============================================================================

/// @description Configures boomerang pickup data.
///
/// Parent Object:
/// - obj_weapon
///
/// Responsibilities:
/// - Configure boomerang weapon payload
/// - Configure pickup visuals
///
/// Notes:
/// - Inventory payload remains data-driven
/// - Shared runtime logic belongs in obj_weapon
/// - Shared combat logic belongs in scr_weapons

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