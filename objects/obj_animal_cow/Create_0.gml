// =============================================================================
// OBJECT:      obj_animal_cow
// EVENT:       Create
// SYSTEM:      Animal Configuration
// =============================================================================

/// @description Configures cow-specific animal data and behavior.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign cow animal type
/// - Configure animal data struct
/// - Setup cow-specific properties
/// - Configure movement/AI tuning
/// - Initialize cow visuals/animation settings
///
/// Notes:
/// - Inherits shared animal behavior from obj_animal_parent
/// - Shared AI logic belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Animal definitions should remain data-driven
/// - Avoid duplicating shared animal logic here

event_inherited();

animal = Animal_Create(ANIMAL.COW);

// Sprite index (down right)
face = 3;
sprite = animal.sprite;

show_debug_message("ANIMAL CREATED: " + string(animal));