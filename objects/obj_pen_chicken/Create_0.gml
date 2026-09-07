// ===========================================================================
// OBJECT:       obj_pen_chicken
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Pen Chicken Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the pen to accept chickens by calling inherited setup and setting accepted_animal = ANIMAL.CHICKEN.
//
// ===========================================================================

event_inherited();

accepted_animal = ANIMAL.CHICKEN;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
