// =============================================================================
// OBJECT:      obj_item_corn
// EVENT:       Create
// SYSTEM:      Item Configuration
// =============================================================================

/// @description Configures corn-specific item behavior and data.
///
/// Parent Object:
/// - obj_item
///
/// Responsibilities:
/// - Assign corn item type
/// - Configure item data struct
/// - Setup vegetable-specific properties
/// - Configure throw/interactions
/// - Initialize visual configuration
///
/// Notes:
/// - Inherits shared behavior from obj_item
/// - Item data should remain data-driven
/// - Shared item logic belongs in scr_items
/// - Avoid duplicating generic item functionality here

event_inherited();

item = Item_Create(ITEM.CORN);