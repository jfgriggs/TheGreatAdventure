// ===========================================================================
// OBJECT:       obj_player
// EVENT:        Cleanup
// REVISION:     1.0.0
// SYSTEM:       Player Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Releases player-owned runtime resources when the player instance is destroyed.
//
// ===========================================================================

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

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
