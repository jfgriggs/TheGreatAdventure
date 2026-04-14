// File: obj_pen.gml
// Event: create

show_debug_message("Pen created: " + object_get_name(object_index));

// Child must set this
//if (!variable_instance_exists(id, "accepted_animal")) {
//    show_debug_message("WARNING: Pen missing accepted_animal");
//    accepted_animal = -1;    // safe fallback
//}

score_value = 100;