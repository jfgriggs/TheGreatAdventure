// ===========================================================================
// OBJECT:       obj_pen
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Pen Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Initializes shared pen data, including score_value, for animal containment areas.
//
// ===========================================================================

show_debug_message("Pen created: " + object_get_name(object_index));

// Child must set this
//if (!variable_instance_exists(id, "accepted_animal")) {
//    show_debug_message("WARNING: Pen missing accepted_animal");
//    accepted_animal = -1;    // safe fallback
//}

score_value = 100;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
