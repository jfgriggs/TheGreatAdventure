function StateMachine(_owner) constructor {

    owner = _owner;
    current = undefined;
    previous = undefined;
    time = 0;

	function change(_new_state) {

	    if (is_undefined(_new_state)) {
	        show_debug_message("STATE ERROR: undefined");
	        return;
	    }

	    // Safe exit
	    if (!is_undefined(current)) {
	        if (variable_struct_exists(current, "exit")) {
	            current.exit();
	        }
	    }

	    previous = current;
	    current = _new_state;
	    time = 0;

	    // Safe enter
	    if (variable_struct_exists(current, "enter")) {
	        current.enter();
	    }
	}

	function update() {
	    time++;

		if (current != undefined && is_method(current.update)) {
            current.update();
        }
		
//	    if (!is_undefined(current)) {
//	        if (variable_struct_exists(current, "update")) {
//	            current.update();
//	        } else {
//				show_debug_message("STATE ERROR: update() method not found");
//			}
//	    }
	}
}