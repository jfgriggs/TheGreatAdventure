// ===========================================================================
// OBJECT:       obj_item_pumpkin
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Pumpkin Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures a pumpkin item with its enum type, definition, life, sprite, and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.PUMPKIN;

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
