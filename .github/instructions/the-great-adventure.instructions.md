---
name: The Great Adventure Engineering Standards
description: "Use when working on The Great Adventure GameMaker project, including GML, objects, scripts, rooms, sprites, tilesets, audio, architecture, reviews, and refactoring."
applyTo: ["**/*.gml", "**/*.yy", "**/*.yyp"]
---

# The Great Adventure Engineering Standards

## Project Priorities

Preserve correctness and gameplay behavior first. Favor simplicity, readability, maintainability, extensibility, and justified performance improvements in that order.

This project is both a commercial-quality game and a learning project. Explain architectural decisions clearly and prefer code that teaches durable engineering concepts.

## Change Discipline

- Review the target file and its nearest callers, parents, children, or neighboring implementation before editing.
- Do not recommend or make a change based only on personal style preference.
- Before recommending a refactor, determine whether the existing behavior is an intentional pattern. Check nearby implementations, call sites, project conventions, documentation, and history when useful.
- Treat established behavior as intentional unless evidence shows a defect, inconsistency, or clear maintainability problem.
- Preserve behavior unless a gameplay or interface change is explicitly requested.
- Prefer the smallest reversible change that addresses the root cause.
- Do not move responsibilities between files, change public interfaces, alter initialization order, introduce subsystems, or change gameplay without explaining the tradeoffs and receiving approval.
- Never revert unrelated user changes.

## Architecture

- Parent objects contain shared behavior.
- Child objects contain species, weapon, enemy, player, building, or item configuration.
- Shared systems remain generic and must not hardcode knowledge of specific object types.
- Prefer data-driven configuration when it makes ownership clearer.
- Initialize data in the subsystem that owns it.
- Keep each subsystem focused on one responsibility.

Relevant subsystem boundaries include movement, animals, tiles, items, state machines, damage, weapons, and general game utilities.

## Initialization and Ownership

- `obj_controller` owns high-level startup and controller-owned resources, including global state, tilemap access, particles, audio, camera state, and initial population spawning.
- `global.controller` is a required dependency for systems that query controller-owned tilemaps or effects. New helpers must document that dependency or validate it at a clear boundary.
- The controller owns global game-state transitions and global timers. Gameplay objects must not create duplicate pause, game-over, or elapsed-time state.
- Child Create events configure values before `event_inherited()` when the parent immediately reads those values. Child presentation or tuning overrides occur after inheritance when the parent establishes shared defaults.

## State Machine Contract

States are structs with a callable `on_update` callback. `on_enter` and `on_exit` are optional callable callbacks. State constructors should capture both `sm` and `owner`, and transitions use `sm.change(NewState(sm))`.

State logic coordinates intent, transitions, and state-specific decisions. Shared movement, collision, damage, and other subsystem behavior stays in the owning subsystem rather than being duplicated inside states.

## Game-State Gating

Gameplay Step events should exit early unless `global.game_state == GAME_STATE.PLAYING`. The controller owns game-state transitions and `global.game_time`. HUD and UI may observe that state but should not maintain competing state.

## Movement Contract

Moving objects use the shared movement interface:

```gml
Movement_Update(self);
```

Expected initialization includes:

```gml
tile_check_blocking = Tile_Is_Blocking;
tile_check_safe = undefined;
stay_in_safe_area = false;
is_safe = false;
move_input_x = 0;
move_input_y = 0;
velocity_x = 0;
velocity_y = 0;
impulse_x = 0;
impulse_y = 0;
acceleration = 0.15;
max_speed = 1.0;
movement_damping = 0.10;
movement_acceleration_multiplier = 1.0;
movement_speed_multiplier = 1.0;
```

Moving entity families should use one movement path and call `Movement_Update(self)`. Do not introduce parallel `speed`, `vx`, `vy`, or custom `apply_movement` APIs without documenting why the entity is intentionally outside the shared movement system.

Do not introduce new uses of `variable_instance_exists()`. Existing uses are legacy behavior and should only be replaced when the surrounding behavior is intentionally reviewed. Use explicit initialization for required fields and `is_callable()` only for genuinely optional callbacks. Do not use `friction` for custom movement state because it conflicts with a GameMaker built-in variable.

## Data-Driven Definitions

Animals, items, and weapons use centralized definition structs. Parent objects consume definitions, while child objects identify the concrete type and provide only justified presentation or tuning overrides. New definitions should clearly identify required identity, gameplay, visual, and runtime fields.

## Resource Ownership

Any `ds_map`, `ds_list`, particle system, audio handle, or other runtime resource created by an instance must have a matching cleanup path. The owner creates, uses, and releases the resource. Do not add cleanup for resources owned by another subsystem.

## Damageable Capabilities

Damageable instances must explicitly initialize the fields required by `Damage_Apply`, such as health, invincibility, previous position, knockback, and death state. Do not assume that every object with an `sm` field is a player; player-specific state callbacks require an explicit capability contract. Do not broaden reflective checks as a substitute for defining that contract.

## Visual and Asset Conventions

- Directional sprite arrays use the `FACE` order `RIGHT`, `UP`, `LEFT`, `DOWN`.
- World entities commonly use `depth = -y` for depth sorting; preserve that convention unless the object has a documented layering reason.
- New assets use lowercase snake case with established prefixes such as `obj_`, `scr_`, `spr_`, and `snd_`.
- Older mixed-case names such as `oTree...` are legacy conventions, not templates for new assets.

## Known Legacy Boundaries

Enemy objects currently appear to use movement fields and update paths that differ from the shared player and animal movement contract. Do not normalize enemy movement opportunistically. Review the complete enemy hierarchy and gameplay behavior before proposing a dedicated change.

## Naming

Use `lowercase_with_underscores`.

- Boolean state: `is_dead`, `is_safe`, `is_visible`, `is_aggressive`
- Boolean capability: `can_move`, `can_attack`, `can_fly`
- Behavior rules: `stay_in_safe_area`
- Runtime references: `target`, `owner`, `leader`, `home`
- Health: `max_hp`, `hp`, `is_dead`
- Movement: `movement_damping`

Do not encode object types into references such as `target_type` or `owner_type` when the referenced instance already communicates that relationship.

## Documentation

Every newly created or modified GML script and object event must use the project's standard header and revision history. Legacy files may be migrated incrementally when they are intentionally reviewed. Use semantic versioning:

Every GML file must have a companion Markdown file with the same base name in the same directory. For example, `scr_movement.gml` has `scr_movement.md`. The companion document explains the file for technology-familiar learners aged 12-16 who are new to software development.

When GML changes, update its companion Markdown file in the same change. Update central guides under `docs/` when architecture, object relationships, public contracts, or workflow changes. Documentation must describe actual behavior and should explain ownership, dependencies, data structures, parent/child relationships, and important learning concepts.

- Major: breaking architectural or public-interface change
- Minor: new functionality or significant refactoring
- Patch: documentation, cleanup, formatting, bug fixes, or small improvements

Scripts use this header shape:

```gml
// ===========================================================================
// SCRIPT:       scr_example
// REVISION:     1.0.0
// SYSTEM:       Example System
// ARCHITECTURE: Shared Example Subsystem
//
// DESCRIPTION:
// Explains responsibility, ownership, and important dependencies.
//
// ===========================================================================
```

Object events use the same shape with `OBJECT` and `EVENT`:

```gml
// ===========================================================================
// OBJECT:       obj_example
// EVENT:        Create
// REVISION:     1.0.0
// SYSTEM:       Example System
// ARCHITECTURE: Example Object Architecture
//
// DESCRIPTION:
// Explains what this event initializes or controls.
//
// ===========================================================================
```

Every modified file includes a `Revision History` section. Use the established `SYSTEM` and `ARCHITECTURE` fields; do not introduce `TYPE` or ad hoc `File`/`Event` headers in new or modified files.

Object event documentation should identify the parent or child relationship when relevant, responsibilities, initialization order, shared subsystem contracts, external dependencies, and runtime resources owned by the event.

Use section headers consistently. Comments explain intent, ownership, or architectural constraints, not obvious implementation steps. Use only `// TODO:` or `// TODO (Future):`.

Public functions use `///` documentation with `@function`, `@description`, `@param`, and `@returns`. Use one `@param` entry per parameter and include its type and purpose. Standardize on `@returns`, not `@return`.

```gml
/// @function Animal_Get_Definition
/// @description Returns the immutable configuration for an animal type.
///
/// @param {ANIMAL} _animal_type The animal definition to retrieve.
/// @returns {Struct} The animal configuration struct.
```

Document private helpers when they encapsulate meaningful behavior. Trivial local operations do not require comments. Keep documentation synchronized with behavior; correct stale names, parent references, event names, and TODO placeholders when the file is intentionally reviewed.

Do not duplicate a parent's complete documentation in every child. A child should document its concrete configuration and meaningful overrides.

## Review Workflow

For meaningful work:

1. Identify the controlling code path.
2. State one falsifiable hypothesis about the behavior or design.
3. Identify the cheapest check that could disconfirm it.
4. Check whether the current pattern is intentional.
5. Make the smallest focused change.
6. Run the narrowest useful validation.
7. Report behavior preserved, risks, and remaining test gaps.

When the correct engineering decision is to leave a file unchanged, explain why.

For existing inconsistencies, distinguish between a defect, an intentional exception, and an unverified legacy pattern. Best-practice rules apply immediately to new code; existing code should be migrated incrementally when its behavior and ownership are understood.
