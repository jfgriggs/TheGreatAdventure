// ===========================================================================
// OBJECT:       obj_item_cabbage
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Item Cabbage Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the shared item as cabbage by selecting ITEM.CABBAGE, creating its definition, copying life, and applying its sprite and mask.
//
// ===========================================================================

event_inherited();

/// =========================
/// ITEM DEFINITION
/// =========================

item_type = ITEM.CABBAGE;

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
