// ===========================================================================
// OBJECT:       obj_projectile_boomerang
// EVENT:        Destroy
// REVISION:     1.0.0
// SYSTEM:       Projectile Boomerang Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Unlocks the owner player's controls when the boomerang is destroyed, if that owner still exists.
//
// ===========================================================================

if (instance_exists(owner)) {
	owner.control_locked = false;
}

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
