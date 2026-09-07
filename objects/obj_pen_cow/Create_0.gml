// ===========================================================================
// OBJECT:       obj_pen_cow
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Pen Cow Object
// ARCHITECTURE: Object Event Architecture
//
// DESCRIPTION:
// Configures the pen to accept cows by inheriting the parent event and setting accepted_animal = ANIMAL.COW.
//
// ===========================================================================

event_inherited();

accepted_animal = ANIMAL.COW;

// ---------------------------------------------------------------------------
// Revision History
// 1.0.0 - Documentation migration; executable behavior unchanged.
// ---------------------------------------------------------------------------
