// =============================================================================
// OBJECT:      obj_animal_chicken
// EVENT:       Create
// SYSTEM:      Animal Configuration
// =============================================================================

/// @description Configures chicken-specific animal data and behavior.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign chicken animal type
/// - Configure animal data struct
/// - Setup chicken-specific properties
/// - Configure movement/AI tuning
/// - Initialize chicken visuals/animation settings
///
/// Notes:
/// - Inherits shared animal behavior from obj_animal_parent
/// - Shared AI logic belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Animal definitions should remain data-driven
/// - Avoid duplicating shared animal logic here

event_inherited();

animal_type = ANIMAL.CHICKEN;
