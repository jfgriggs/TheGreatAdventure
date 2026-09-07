---
name: gamemaker-development
description: "Use for The Great Adventure GameMaker Studio development, GML reviews, object and script refactoring, gameplay debugging, architecture decisions, sprite and audio integration, and focused validation."
argument-hint: "Describe the GameMaker file, behavior, or subsystem to inspect."
user-invocable: true
---

# GameMaker Development

## Purpose

Provide a disciplined, one-file-at-a-time workflow for maintaining The Great Adventure as a professional-quality GameMaker project and learning codebase.

## When to Use

- Review or refactor a GML script, object event, room, asset, or shared subsystem.
- Debug movement, tiles, animals, state machines, combat, inventory, weapons, audio, or initialization.
- Evaluate an architecture or asset change before implementation.
- Validate that a focused change preserves behavior.

## Procedure

1. Identify the concrete file, symbol, failing behavior, or call site.
2. Read the smallest nearby context needed to identify the controlling code path.
3. State one falsifiable hypothesis about the behavior or design.
4. Identify the cheapest check that could disconfirm the hypothesis.
5. Determine whether the current pattern is intentional before recommending a change. Check neighboring implementations, parents, children, call sites, documentation, project conventions, and history when useful.
6. Explain strengths and architectural observations.
7. Classify inconsistencies as defects, intentional exceptions, or unverified legacy patterns. Do not normalize an unverified pattern opportunistically.
8. For significant changes, explain the current limitation, proposed design, tradeoffs, affected files, and wait for approval.
9. Make the smallest focused edit only when authorized.
10. Update the matching `.md` companion file in the same directory whenever GML changes.
11. Update central `docs/` guides when architecture, relationships, public contracts, or workflow changes.
12. Validate with the narrowest useful test, run, compile, lint, or inspection available.
13. Report behavior preserved, documentation updated, validation performed, remaining risk, and the next recommended file.

## Architectural Rules

- Parents contain behavior; children contain configuration.
- Shared systems remain generic.
- Initialize data in the subsystem that owns it.
- Prefer named constants and data-driven configuration over magic numbers.
- `obj_controller` owns high-level startup, controller resources, global game state, and global timers.
- Child configuration precedes `event_inherited()` when the parent reads it; child presentation overrides follow inheritance when the parent supplies defaults.
- States are structs with callable `on_update`; `on_enter` and `on_exit` are optional; state constructors capture `sm` and `owner`.
- Gameplay Step events gate on `GAME_STATE.PLAYING`.
- Runtime resources require cleanup by their owning instance or subsystem.
- Preserve existing interfaces and initialization order unless an approved change requires otherwise.
- Use the complete shared movement interface and one movement path per entity family.
- Do not introduce new `variable_instance_exists()` calls; treat existing uses as legacy until deliberately reviewed.
- Use `is_callable()` only for optional callbacks.
- Use `movement_damping`, never custom `friction` state.
- Treat current enemy movement differences as a known boundary requiring a complete hierarchy review.

## Project Validation Checklist

Before accepting a change, check the applicable items:

- Does the Create-event ordering match what the parent reads and what the child overrides?
- Does a moving object initialize the complete movement contract and use the intended movement path?
- Does a gameplay Step event respect `GAME_STATE.PLAYING`?
- Does a state provide callable `on_update` and avoid duplicating shared subsystem behavior?
- Are centralized definition structs and controller-owned dependencies respected?
- Are all instance-owned dynamic resources released in cleanup?
- Are required damageable capabilities explicit rather than inferred from unrelated fields?
- Are `FACE` ordering, depth sorting, and asset naming conventions preserved?
- Does every modified GML file have the standard script or object-event header and revision history?
- Do public functions use complete `@function`, `@description`, `@param`, and `@returns` documentation?
- Are stale names, parent references, event names, and TODO documentation corrected when the file is intentionally reviewed?
- Does every GML file have a same-directory Markdown companion, and was it updated with the source change?
- Are central learning guides updated when the architecture or public contract changes?

## Review Standard

A recommendation must be grounded in correctness, maintainability, extensibility, or meaningful performance. Do not recommend a change solely because another style is preferred. If evidence suggests the existing behavior is intentional and sound, leave it unchanged and explain why.

## Documentation Standard

Every newly created or modified GML script and object event must use the project's standard header and revision history. Scripts identify `SCRIPT`, `REVISION`, `SYSTEM`, `ARCHITECTURE`, and `DESCRIPTION`. Object events identify `OBJECT`, `EVENT`, `REVISION`, `SYSTEM`, `ARCHITECTURE`, and `DESCRIPTION`.

Public functions use `///` documentation with `@function`, `@description`, one typed `@param` per argument, and a typed `@returns` entry. Use `@returns` consistently. Document meaningful private helpers, but do not narrate trivial statements.

Legacy files may be migrated incrementally during intentional review. Do not perform broad documentation-only rewrites in unrelated files. Documentation must describe actual ownership, parent relationships, initialization order, dependencies, and behavior; stale names and placeholder TODO descriptions should be corrected when the surrounding file is being changed.

## Learning Audience

Write companion documentation for readers aged 12-16 who are comfortable using technology but have no software development experience. Explain terms such as event, parent object, child object, struct, callback, state machine, ownership, and dependency the first time they appear. Use short examples when they make an idea easier to understand.

## Response Standard

For reviews, use:

1. Summary
2. Revision number, when applicable
3. Strengths
4. Findings ordered by severity
5. Recommendations with rationale
6. Validation or test gaps
7. Next recommended file

When returning a modified file, return the complete canonical replacement, including the project header, revision history, public function documentation, and consistent section organization where applicable.
