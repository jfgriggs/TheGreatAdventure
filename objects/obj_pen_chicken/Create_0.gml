// =============================================================================
// OBJECT:      obj_pen_chicken
// EVENT:       Create
// SYSTEM:      Pen Configuration
// =============================================================================

/// @description
/// Configures chicken-specific pen data and containment behavior.
///
/// Parent Object:
/// - obj_pen
///
/// Responsibilities:
/// - Assign accepted animal type
/// - Configure chicken pen settings
/// - Setup scoring/reward values
/// - Configure visual/debug settings
/// - Initialize chicken-specific containment behavior
///
/// Notes:
/// - Inherits shared pen behavior from obj_pen_parent
/// - Pen validation should remain data-driven
/// - Shared containment logic belongs in parent systems
/// - Avoid duplicating generic pen functionality here

event_inherited();

accepted_animal = ANIMAL.CHICKEN;
