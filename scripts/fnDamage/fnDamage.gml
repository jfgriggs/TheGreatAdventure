// Damage calculation
function get_damaged_create(_hp = 10, _iframes = false) {
	hp = _hp;
	
	// Get the iframes
	if _iframes == true {
		iframeTimer = 0;
		iframeNumber = 90;
	}
	
	// Create damage list
	if _iframes == false damageList = ds_list_create();
}

/*
function get_damaged_cleanup() {
	ds_list_destroy(damageList);
}

// Damage	step event
function get_damaged(_damageObj, _iframes = false) {
	// Special exit for iframe timer
	if _iframes == true && iframeTimer > 0 {
		iframeTimer--;
		
		if iframeTimer mod 8 == 0 {
			if image_alpha == 1 {
				image_alpha = 0;
			} else {
				image_alpha = 1;
			}
		}
		
		exit;
	}
	
	// Make sure the iframe blinking stops
	if _iframes == true	image_alpha = 1;
	
	// Receive damage
		if place_meeting(x, y, _damageObj) {
		
			// Get list of damage instances
			var _instList = ds_list_create();
			instance_place_list(x, y, _damageObj, _instList, false);

			var list_size = ds_list_size(_instList);

			// Loop through the list
			var _hitConfirm = false;
			
			for  (var i = 0; i < list_size; i++) {

				// Get daomage object instance from list
				var _inst = ds_list_find_value(_instList, i);
			
				// Check if this instance is already in damage list
				if _iframes == true || ds_list_find_index(damageList, _inst) == -1 {
				
					// Add new instance to the damage list
					if _iframes == false ds_list_add(damageList, _inst);
				
					// Take damage from specific instaance
					hp -= _inst.damage;
					_hitConfirm = true;
	
					// Tell the damage instance is has impacted
					_inst.hitConfirm = true;
				}
			}
			
			// Set iframes if we were hit
			if _iframes == true && _hitConfirm {
				iframeTimer =	iframeNumber;
			}

			// Free up memory
			ds_list_destroy(_instList);
	
		}
	
		// Clear the damage list of objects that don't exist anymore or aren't touching anymore
		if _iframes == false {
			var _damageListSize = ds_list_size(damageList);
			for (var i = 0; i < _damageListSize; i++ ) {
				// If not touching the damage instance anymore, remove it from the list and set loop back 1 position
				var _inst = ds_list_find_value(damageList, i);
				if !instance_exists(_inst) || !place_meeting(x, y, _inst) {
					ds_list_delete(damageList, i);
					i--;
					_damageListSize--;
				}
		
			}
		}
}
*/