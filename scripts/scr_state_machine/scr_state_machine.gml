/// @struct StateMachine
/// @description Generic reusable finite state machine.
///
/// Responsibilities:
/// - Store current state
/// - Handle transitions
/// - Execute update methods
///
/// Expected State Interface:
/// - enter()
/// - update()
/// - exit()
///
/// Notes:
/// - States are structs
/// - States should remain stateless when possible

function StateMachine(_owner) constructor {

    owner = _owner;
	
	current = undefined;
	time = 0;

    // =========================================
    // Validate state
    // =========================================

    validate_state = function(_state) {
        if (!is_struct(_state)) {
            show_error("StateMachine Error: State is not a struct.", true);
            return false;
        }

        if (!variable_struct_exists(_state, "update")) {
            show_error("StateMachine Error: State missing update() method.", true);
            return false;
        }

        if (!is_callable(_state.update)) {
            show_error("StateMachine Error: update is not callable.", true);
            return false;
        }

        return true;
    };

    // =========================================
    // Change state
    // =========================================
    change = function(_new_state) {
        validate_state(_new_state);

        // Exit current state
        if (!is_undefined(current)) {
            if (variable_struct_exists(current, "exit")) {
                if (is_callable(current.exit)) {
                    current.exit();
                }
            }
        }

        current = _new_state;
        time = 0;

        // Enter new state
        if (variable_struct_exists(current, "enter")) {
            if (is_callable(current.enter)) {
                current.enter();
            }
        }
    };

    // =========================================
    // Update current state
    // =========================================
    update = function() {
        time++;

        if (is_undefined(current)) {
            return;
        }

        current.update();
    };
}