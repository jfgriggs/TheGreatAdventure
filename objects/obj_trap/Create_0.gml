// =============================================================================
// OBJECT:      obj_trap
// EVENT:       Create
// SYSTEM:      Trap Initialization
// =============================================================================

/// @description Initializes trap configuration, activation behavior, damage settings, and runtime interaction variables.
///
/// Responsibilities:
/// - Initialize trap data
/// - Configure activation behavior
/// - Setup damage/effect values
/// - Configure collision/interactions
/// - Initialize visual/audio settings
/// - Setup runtime timers/state
///
/// Notes:
/// - Trap behavior should remain data-driven
/// - Shared damage/combat logic belongs in scr_combat
/// - Terrain interaction should remain centralized
/// - Avoid hardcoding trap-specific behavior where possible

lifetime = 300;
radius = 20;