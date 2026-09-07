// ===========================================================================
// OBJECT:       obj_item_pepper
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Pepper Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a pepper item with ITEM.PEPPER, its definition, life, sprite, and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.PEPPER;

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
