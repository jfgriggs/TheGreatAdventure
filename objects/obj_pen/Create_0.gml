// =============================================================================
// OBJECT:      obj_pen
// EVENT:       Create
// SYSTEM:      Pen Base Initialization
// =============================================================================

/// @description Initializes shared pen systems, runtime variables, and animal containment behavior for all pen child objects.
///
/// Child Objects:
/// - obj_pen_chicken
/// - obj_pen_cow
/// - obj_pen_*
///
/// Responsibilities:
/// - Initialize pen configuration
/// - Setup accepted animal type
/// - Configure containment behavior
/// - Initialize scoring/reward variables
/// - Setup visual/debug configuration
/// - Configure interaction settings
///
/// Notes:
/// - Child objects assign supported animal type
/// - Pens should remain data-driven
/// - Shared validation logic should remain centralized
/// - Avoid species-specific logic in parent object

show_debug_message("Pen created: " + object_get_name(object_index));

// Child must set this
//if (!variable_instance_exists(id, "accepted_animal")) {
//    show_debug_message("WARNING: Pen missing accepted_animal");
//    accepted_animal = -1;    // safe fallback
//}

score_value = 100;