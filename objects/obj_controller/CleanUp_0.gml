// =============================================================================
// OBJECT:      obj_controller
// EVENT:       Clean Up
// SYSTEM:      Resource Management
// =============================================================================

/// @description Cleans up controller-owned runtime resources.
///
/// Responsibilities:
/// - Destroy particle systems
/// - Destroy particle types
/// - Release runtime resources
///
/// Notes:
/// - Prevents memory/resource leaks
/// - Only cleanup resources owned by controller

part_type_destroy(pt_spark);
part_system_destroy(ps);