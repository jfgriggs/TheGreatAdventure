// ===========================================================================
// OBJECT:       obj_controller
// EVENT:        Cleanup
// REVISION:     1.0.0
// SYSTEM:       Controller Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Releases runtime resources created and owned by the controller when it is removed.
//
// ===========================================================================

part_type_destroy(pt_spark);
part_system_destroy(ps);

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
