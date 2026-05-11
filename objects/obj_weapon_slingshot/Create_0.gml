// =============================================================================
// OBJECT:      obj_weapon_slingshot
// EVENT:       Create
// SYSTEM:      Weapon Configuration
// =============================================================================

/// @description Configures slingshot-specific item behavior and data.
///
/// Parent Object:
/// - obj_weapon
///
/// Responsibilities:
/// - Assign slingshot item type
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

weapon_type = WEAPON.SLINGSHOT;