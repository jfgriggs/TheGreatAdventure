// File: obj_player.gml
// Event: clean up

// Weapons list
if (ds_exists(weapons, ds_type_list)) {
    ds_list_destroy(weapons);
}

// Inventory list
if (ds_exists(inventory, ds_type_list)) {
    ds_list_destroy(inventory);
}