// File: obj_animal_sheep.gml
// Event: create

event_inherited();

animal = Animal_Create(ANIMAL.SHEEP);

// Sprite index (down right)
face = 3;
sprite = animal.sprite;

show_debug_message("ANIMAL CREATED: " + string(animal));