// ===========================================================================
// OBJECT:       obj_item_corn
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Corn Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a corn item with ITEM.CORN, the centralized item definition, its life, and sprite mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.CORN;

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
