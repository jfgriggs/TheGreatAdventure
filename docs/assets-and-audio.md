# Graphics And Audio

Sprites, tilesets, particles, and sounds are part of the game's communication system. They tell the player what happened.

Directional sprites use the `FACE` order `RIGHT`, `UP`, `LEFT`, `DOWN`. World objects commonly use `depth = -y` so objects lower on the screen appear in front.

New assets use readable lowercase prefixes such as `spr_`, `snd_`, and `obj_`. Older `oTree...` names are historical and should not be copied for new assets.

The controller owns looping music startup. Gameplay objects often own one-shot feedback for their events. When audio ownership changes, document who starts, stops, and cleans up the resource.
