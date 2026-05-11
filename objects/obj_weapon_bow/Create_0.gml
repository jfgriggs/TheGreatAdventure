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

weapon_type = WEAPON.BOW;