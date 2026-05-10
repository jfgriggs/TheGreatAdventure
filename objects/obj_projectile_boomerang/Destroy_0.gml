/// =============================================================================
/// OBJECT: obj_boomerang
/// EVENT: Destroy
/// DESCRIPTION:
/// Unlocks player movement when boomerang is removed.
/// =============================================================================

if (instance_exists(owner)) {
    owner.movement_locked = false;
}