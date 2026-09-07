// ===========================================================================
// SCRIPT:       scr_state_machine
// REVISION:     1.0.0
// SYSTEM:       State Machine System
// ARCHITECTURE: Shared State Machine System
//
// DESCRIPTION:
// Defines the StateMachine constructor. It stores the current behavior state, its owner, and time spent in that state.
//
// ===========================================================================

/// @function StateMachine
/// @description Handles statemachine for this file's subsystem.
/// @param {Any} _owner Input used by StateMachine.
/// @returns {Any} The result of the operation, when it produces one.
function StateMachine(_owner) constructor {
	owner = _owner;

	current = undefined;
	time = 0;

	// =========================================
	// Validate state
	// =========================================

/// @function validate_state
/// @description Handles validate state for this file's subsystem.
/// @param {Any} _state Input used by validate_state.
/// @returns {Any} The result of the operation, when it produces one.
	validate_state = function(_state) {
		if (!is_struct(_state)) {
			show_error("StateMachine Error: State is not a struct.", true);
			return false;
		}

		if (!variable_struct_exists(_state, "on_update")) {
			show_error("StateMachine Error: State missing on_update() method.", true);
			return false;
		}

		if (!is_callable(_state.on_update)) {
			show_error("StateMachine Error: on_update is not callable.", true);
			return false;
		}

		return true;
	};

	// =========================================
	// Change state
	// =========================================
/// @function change
/// @description Handles change for this file's subsystem.
/// @param {Any} _new_state Input used by change.
/// @returns {void} The result of the operation, when it produces one.
	change = function(_new_state) {
		validate_state(_new_state);

		// Exit current state
		if (!is_undefined(current)) {
			if (variable_struct_exists(current, "on_exit")) {
				if (is_callable(current.on_exit)) {
					current.on_exit();
				}
			}
		}

		current = _new_state;
		time = 0;

		// Enter new state
		if (variable_struct_exists(current, "on_enter")) {
			if (is_callable(current.on_enter)) {
				current.on_enter();
			}
		}
	};

	// =========================================
	// Update current state
	// =========================================
/// @function update
/// @description Handles update for this file's subsystem.
/// @returns {Any} The result of the operation, when it produces one.
	update = function() {
		time++;

		if (is_undefined(current)) {
			return;
		}

		if (variable_struct_exists(current, "on_update")) {
			current.on_update();
		} else {
			show_error("StateMachine Error: State missing on_update() method.", true);
		}
	};
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
