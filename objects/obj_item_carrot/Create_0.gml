// =============================================================================
// OBJECT:      obj_item_carrot
// EVENT:       Create
// SYSTEM:      Item Configuration
// =============================================================================

/// @description Configures carrot-specific item behavior and data.
///
/// Parent Object:
/// - obj_item
///
/// Responsibilities:
/// - Assign carrot item type
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


/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.CARROT;

item = Item_Create(item_type);


/// =========================
/// RUNTIME
/// =========================

life = item.life;


/// =========================
/// VISUALS
/// =========================

sprite_index = item.sprite;
mask_index = item.sprite;