// ===========================================================================
// OBJECT:       obj_item_carrot
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Carrot Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures an item as carrot using ITEM.CARROT, its centralized definition, life value, and sprite mask.
//
// ===========================================================================

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
