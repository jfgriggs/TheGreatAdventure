// =============================================================================
// OBJECT:      obj_animal_chicken
// EVENT:       Create
// SYSTEM:      Chicken Configuration
// =============================================================================

/// @description
/// Identifies this instance as a chicken.
///
/// All species configuration is loaded by the parent object using
/// Animal_Get_Definition(animal_type).

animal_type = ANIMAL.CHICKEN;
event_inherited();