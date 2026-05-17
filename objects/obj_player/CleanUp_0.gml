// =============================================================================
// OBJECT:      obj_player
// EVENT:       Clean Up
// SYSTEM:      Player Resource Management
// =============================================================================

/// @description Cleans up player-owned runtime resources.
///
/// Responsibilities:
/// - Destroy temporary runtime data
/// - Cleanup dynamic references
/// - Release owned resources
///
/// Notes:
/// - Only cleanup resources owned by player instance
/// - Prevent dangling references and memory leaks

// Weapons list
if (ds_exists(weapons, ds_type_list)) {
    ds_list_destroy(weapons);
}

// Inventory list
if (ds_exists(inventory, ds_type_list)) {
	var keys = ds_map_keys_to_array(inventory);
	for (var i = 0; i < array_length(keys); i++) {
	    var stack = inventory[? keys[i]];
	    ds_list_destroy(stack);
	}
	ds_map_destroy(inventory);
}
