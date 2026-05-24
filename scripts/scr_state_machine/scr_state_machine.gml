// =============================================================================
// SCRIPT:      scr_state_machine
// TYPE:        Shared State Machine Subsystem
// =============================================================================

/// @description Centralized reusable state machine system used by player, animal, and enemy AI systems.
///
/// Responsibilities:
/// - State creation/management
/// - State transitions
/// - Enter/exit callback handling
/// - State validation
/// - Update dispatching
/// - Runtime state tracking
///
/// Public API:
/// - StateMachine()
/// - sm.change()
/// - sm.update()
/// - sm.is_state()
///
/// Notes:
/// - States are struct-based
/// - States should contain:
///     name
///     update
///     optional enter
///     optional exit
/// - Explicit owner injection is required
/// - Transitions use sm.change(NewState(sm))
/// - Shared gameplay logic should remain outside state machine core
/// - Keep this subsystem generic and reusable

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
