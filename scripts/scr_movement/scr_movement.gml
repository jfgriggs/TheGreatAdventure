// =============================================================================
// SCRIPT:       scr_movement
// SYSTEM:       Movement
// ARCHITECTURE: Shared Movement System
//
// DESCRIPTION:
// Provides centralized movement, terrain interaction, collision detection,
// and movement restrictions for all moving entities.
//
// Objects using this system are expected to initialize the standard movement
// interface during their Create event.
//
// Objects using this system should initialize:
//   move_input_x
//   move_input_y
//   velocity_x
//   velocity_y
//   impulse_x
//   impulse_y
//   acceleration
//   max_speed
//   movement_damping
//   movement_speed_multiplier
//   tile_check_blocking
//   tile_check_safe
//   stay_in_safe_area
//   is_safe
// =============================================================================


/// @function Movement_Get_Terrain_Speed_Factor
/// @description
/// Returns the movement speed multiplier for the terrain beneath an instance.
///
/// @param _inst
/// @return {Real}
function Movement_Get_Terrain_Speed_Factor(_inst)
{
	var tile = Tile_Get(_inst.x, _inst.y);

	switch (tile)
	{
		case TILE.MUD:
		case TILE.PIG_PEN:
			return 0.25;

		case TILE.WATER:
			return 0.15;

		default:
			return 1.0;
	}
}


/// @function Movement_Can_Move_To
/// @description
/// Determines whether an instance may move to the specified position.
///
/// Performs tile blocking and optional safe-area validation.
///
/// @param _inst
/// @param _x
/// @param _y
/// @return {Boolean}
function Movement_Can_Move_To(_inst, _x, _y)
{
	var tile = Tile_Get(_x, _y);

	// -------------------------------------------------------------------------
	// Blocking Terrain
	// -------------------------------------------------------------------------

	if (is_callable(_inst.tile_check_blocking))
	{
		if (_inst.tile_check_blocking(tile))
		{
			return false;
		}
	}

	// -------------------------------------------------------------------------
	// Safe Area Restriction
	// -------------------------------------------------------------------------

	if (_inst.stay_in_safe_area && _inst.is_safe)
	{
		if (is_callable(_inst.tile_check_safe))
		{
			if (!_inst.tile_check_safe(tile))
			{
				return false;
			}
		}
	}

	// -------------------------------------------------------------------------
	// Future Instance Collision
	// -------------------------------------------------------------------------
	//
	// TODO (Future):
	// - Dynamic blockers
	// - Doors
	// - NPCs
	// - Pushable objects
	//

	return true;
}


/// @function Movement_Resolve
/// @description
/// Attempts movement using full movement first, then falls back to X-only and
/// Y-only movement when blocked.
///
/// @param _inst
/// @param _vx
/// @param _vy
function Movement_Resolve(_inst, _vx, _vy)
{
	// NOTE:
	// Terrain currently affects acceleration and maximum speed. Direct movement
	// scaling remains disabled to preserve existing movement feel.
	var move_x = _vx;
	var move_y = _vy;

	var target_x = _inst.x + move_x;
	var target_y = _inst.y + move_y;

	// -------------------------------------------------------------------------
	// Full Movement
	// -------------------------------------------------------------------------

	if (Movement_Can_Move_To(_inst, target_x, target_y))
	{
		_inst.x = target_x;
		_inst.y = target_y;
		return;
	}

	// -------------------------------------------------------------------------
	// Horizontal Fallback
	// -------------------------------------------------------------------------

	if (Movement_Can_Move_To(_inst, _inst.x + move_x, _inst.y))
	{
		_inst.x += move_x;
	}

	// -------------------------------------------------------------------------
	// Vertical Fallback
	// -------------------------------------------------------------------------

	if (Movement_Can_Move_To(_inst, _inst.x, _inst.y + move_y))
	{
		_inst.y += move_y;
	}
}


/// @function Movement_Update
/// @description
/// Executes the shared movement pipeline for an object.
///
/// Pipeline:
/// - Input damping
/// - Acceleration
/// - Speed limiting
/// - External impulses
/// - Movement Damping
/// - Velocity Validation
/// - Collision resolution
///
/// @param _inst
function Movement_Update(_inst)
{
	// -------------------------------------------------------------------------
	// Input Damping
	// -------------------------------------------------------------------------

	if (_inst.move_input_x == 0) {
		_inst.velocity_x = lerp(_inst.velocity_x, 0, 0.35);
	}

	if (_inst.move_input_y == 0) {
		_inst.velocity_y = lerp(_inst.velocity_y, 0, 0.35);
	}

	// -------------------------------------------------------------------------
	// Input Acceleration
	// -------------------------------------------------------------------------

	var terrain_factor = Movement_Get_Terrain_Speed_Factor(_inst);

	_inst.velocity_x += _inst.move_input_x 
		* _inst.acceleration
		* _inst.movement_acceleration_multiplier
		* terrain_factor;
	_inst.velocity_y += _inst.move_input_y 
		* _inst.acceleration 
		* _inst.movement_acceleration_multiplier 
		* terrain_factor;

	// -------------------------------------------------------------------------
	// Speed Limit
	// -------------------------------------------------------------------------
	
	var velocity = point_distance(0, 0, _inst.velocity_x, _inst.velocity_y);
	var effective_max_speed = _inst.max_speed * _inst.movement_speed_multiplier * terrain_factor;
	
	//show_debug_message(
	//    "velocity=" + string(velocity)
	//    + " effective_max=" + string(effective_max_speed)
	//);
	
	if (velocity > effective_max_speed)
	{
		var dir = point_direction(0, 0, _inst.velocity_x, _inst.velocity_y);

		_inst.velocity_x = lengthdir_x(effective_max_speed, dir);
		_inst.velocity_y = lengthdir_y(effective_max_speed, dir);
	}

	// -------------------------------------------------------------------------
	// External Impulses
	// -------------------------------------------------------------------------

	_inst.velocity_x += _inst.impulse_x;
	_inst.velocity_y += _inst.impulse_y;

	// -------------------------------------------------------------------------
	// Impulse Decay
	// -------------------------------------------------------------------------

	_inst.impulse_x *= 0.55;
	_inst.impulse_y *= 0.55;

	if (abs(_inst.impulse_x) < 0.01) {
		_inst.impulse_x = 0;
	}

	if (abs(_inst.impulse_y) < 0.01) {
		_inst.impulse_y = 0;
	}

	// -------------------------------------------------------------------------
	// Movement Damping
	// -------------------------------------------------------------------------

	if (abs(_inst.velocity_x) < 0.02) {
		_inst.velocity_x = 0;
	}

	if (abs(_inst.velocity_y) < 0.02) {
		_inst.velocity_y = 0;
	}

	// -------------------------------------------------------------------------
	// Velocity Validation
	// -------------------------------------------------------------------------

	if (is_nan(_inst.velocity_x) || !is_real(_inst.velocity_x))
	{
		_inst.velocity_x = 0;
	}

	if (is_nan(_inst.velocity_y) || !is_real(_inst.velocity_y))
	{
		_inst.velocity_y = 0;
	}

	// -------------------------------------------------------------------------
	// Resolve Movement
	// -------------------------------------------------------------------------

	Movement_Resolve(_inst, _inst.velocity_x, _inst.velocity_y);
}