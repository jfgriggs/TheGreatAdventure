# The Great Adventure Documentation

Welcome to the learning guide for **The Great Adventure**.

This project is a GameMaker game, but it is also a place to learn how larger software is organized. The documentation explains not only what the code does, but why it is arranged that way.

## Start Here

1. [Architecture](architecture.md) explains the big pieces and how they cooperate.
2. [Object Hierarchy](object-hierarchy.md) explains parent and child objects.
3. [Data Structures](data-structures.md) explains structs, arrays, maps, and lists.
4. [Documentation Rules](documentation-rules.md) explains how code and documentation stay together.

Each `.gml` file has a matching `.md` file in the same folder. For example:

- `scripts/scr_movement/scr_movement.gml`
- `scripts/scr_movement/scr_movement.md`

The matching file is the first place to look when learning one piece of the game.

## How To Read A Feature

Start with the shared script, then read the parent object, then read one child object. This shows the reusable behavior first and the specialized settings second.

When changing code, update its matching Markdown file in the same change. Documentation is part of the feature, not an afterthought.
