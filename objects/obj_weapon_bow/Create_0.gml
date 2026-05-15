// =============================================================================
// OBJECT:      obj_weapon_bow
// EVENT:       Create
// SYSTEM:      Weapon Configuration
// =============================================================================

/// @description Configures bow-specific item behavior and data.
///
/// Parent Object:
/// - obj_weapon
///
/// Responsibilities:
/// - Assign bow item type
/// - Configure item data struct
/// - Setup weapon-specific properties
/// - Configure interactions
/// - Initialize visual configuration
///
/// Notes:
/// - Inherits shared behavior from obj_item
/// - Item data should remain data-driven
/// - Shared item logic belongs in scr_items
/// - Avoid duplicating generic item functionality here

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