// ===========================================================================
// OBJECT:       obj_item_watermelon
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Watermelon Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a watermelon item with ITEM.WATERMELON, its definition, life, sprite, and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.WATERMELON;

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
