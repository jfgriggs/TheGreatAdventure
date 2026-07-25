// =============================================================================
// OBJECT:      obj_animal_sheep
// EVENT:       Create
// SYSTEM:      Sheep Configuration
// =============================================================================

/// @description
/// Identifies this instance as a sheep.
///
/// All species configuration is loaded by the parent object using
/// Animal_Get_Definition(animal_type).

animal_type = ANIMAL.SHEEP;
event_inherited();