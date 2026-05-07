// =============================================================================
// OBJECT:      obj_animal_sheep
// EVENT:       Create
// SYSTEM:      Animal Configuration
// =============================================================================

/// @description Configures sheep-specific animal data and behavior.
///
/// Parent Object:
/// - obj_animal
///
/// Responsibilities:
/// - Assign sheep animal type
/// - Configure animal data struct
/// - Setup sheep-specific properties
/// - Configure movement/AI tuning
/// - Initialize sheep visuals/animation settings
///
/// Notes:
/// - Inherits shared animal behavior from obj_animal_parent
/// - Shared AI logic belongs in scr_animal_states
/// - Shared movement logic belongs in scr_movement
/// - Animal definitions should remain data-driven
/// - Avoid duplicating shared animal logic here

event_inherited();

animal = Animal_Create(ANIMAL.SHEEP);

// Sprite index (down right)
face = 3;
sprite = animal.sprite;

show_debug_message("ANIMAL CREATED: " + string(animal));