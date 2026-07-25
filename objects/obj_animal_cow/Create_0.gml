// =============================================================================
// OBJECT:      obj_animal_cow
// EVENT:       Create
// SYSTEM:      Cow Configuration
// =============================================================================

/// @description
/// Identifies this instance as a cow.
///
/// All species configuration is loaded by the parent object using
/// Animal_Get_Definition(animal_type).

animal_type = ANIMAL.COW;
event_inherited();