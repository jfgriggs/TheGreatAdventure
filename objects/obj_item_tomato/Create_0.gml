// ===========================================================================
// OBJECT:       obj_item_tomato
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Tomato Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a tomato item with ITEM.TOMATO, its definition, life value, sprite, and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.TOMATO;

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
