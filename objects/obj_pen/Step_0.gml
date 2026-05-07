// =============================================================================
// OBJECT:      obj_pen
// EVENT:       Step
// SYSTEM:      Pen Base Runtime Update
// =============================================================================

/// @description Updates shared pen behavior, animal validation, containment checks, and scoring interactions for all pen child objects.
///
/// Child Objects:
/// - obj_pen_chicken
/// - obj_pen_cow
/// - obj_pen_*
///
/// Responsibilities:
/// - Detect nearby animals
/// - Validate accepted animal types
/// - Process animal safety state
/// - Trigger scoring/reward behavior
/// - Handle containment interactions
/// - Update visual/debug state
///
/// Notes:
/// - Shared validation systems should remain centralized
/// - Animal state changes should remain data-driven
/// - Avoid embedding species-specific logic directly here

// Check for animals inside pen
//with (obj_animal_sheep) {

//    if (place_meeting(x, y, other)) {

//        other.saved_count++;
//        global.points += animal.point_value;

//        instance_destroy();
//    }
//}