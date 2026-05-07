// =============================================================================
// OBJECT:      obj_item_watermelon
// EVENT:       Create
// SYSTEM:      Item Configuration
// =============================================================================

/// @description Configures watermelon-specific item behavior and data.
///
/// Parent Object:
/// - obj_item
///
/// Responsibilities:
/// - Assign watermelon item type
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

item = Item_Create(ITEM.WATERMELON);