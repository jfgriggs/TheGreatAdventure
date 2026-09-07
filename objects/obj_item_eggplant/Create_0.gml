// ===========================================================================
// OBJECT:       obj_item_eggplant
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Eggplant Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures an eggplant item with its enum type, definition struct, life, sprite, and collision mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.EGGPLANT;

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
