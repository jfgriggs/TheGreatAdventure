/// =============================================================================
/// OBJECT:      obj_animal
/// EVENT:       Draw
/// DESCRIPTION:
///     Draws the animal with runtime visual feedback.
///
/// RESPONSIBILITIES:
///     - draw directional animal sprite
///     - tint safe animals
///     - preserve animation playback
///     - reset draw state afterward
///
/// SAFE VISUALS:
///     Animals inside their correct pen are tinted green
///     using image_blend.
///
/// NOTES:
///     Gameplay logic remains centralized elsewhere:
///
///     - AI/state machine       -> scr_animal_states
///     - movement/collision     -> apply_movement()
///     - tile logic             -> scr_tiles
///     - safety detection       -> Animal_IsSafe()
///
///     This Draw Event is presentation-only.
/// =============================================================================


/// =========================================================
/// SAFE COLOR
/// =========================================================
if (is_safe) {
    image_blend = merge_color(c_white, c_lime, 0.35)
} else {
    image_blend = merge_color(c_white, c_lime, 0);
}


/// =========================================================
/// DRAW ANIMAL
/// =========================================================
draw_self();


/// =========================================================
/// RESET DRAW STATE
/// =========================================================
image_blend = c_white;