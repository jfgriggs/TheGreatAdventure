# Documentation Rules

Every GML source file has a matching `.md` file in the same directory. The Markdown file teaches the purpose and relationships of the source file.

## Companion File Contents

Each companion document should explain:

- What the file is responsible for.
- What it owns and what it depends on.
- Important inputs, outputs, fields, or callbacks.
- Parent and child relationships, when relevant.
- The main learning concepts used.
- Known legacy behavior or limitations.

## Updating Documentation

When GML changes, update its companion document in the same change. Update central guides when an architecture rule, object relationship, public contract, or workflow changes.

Update the relevant `.drawio` diagram when a system relationship, object hierarchy, state transition, or update flow shown in that diagram changes.

Use the source file's base name for its companion: `Create_0.gml` becomes `Create_0.md` in the same folder. A companion document is not a copy of the source. It is a learning guide that explains what the source does and why it belongs there.

Do not claim that code does something it does not do. If behavior is unusual, label it as intentional, defective, or legacy only when there is evidence.

Documentation should use plain language for readers aged 12-16 who are comfortable with technology but are new to software development. Explain technical words the first time they appear.

Before finishing a change, check that every changed GML file still has a companion, that the companion matches actual behavior, and that central guides are updated when the change affects architecture or a public contract.
