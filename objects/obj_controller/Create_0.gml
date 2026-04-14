// File: obj_controller.gml
// Event: create

// Game states
enum GAME_STATE {
	START,
	PLAYING,
	PAUSED,
	GAME_OVER
}

// --- Globals ---
global.game_state = GAME_STATE.START
global.game_time = 0;
global.points = 0;
global.best_time = 0;
global.FPS = game_get_speed(gamespeed_fps);

// Store controller reference
global.controller = id;

// Fade in/out
fade_alpha  = 0.5;     // 1 = fully black, 0 = visible
fade_target = 1;     // where we want to go
fade_speed  = 0.05;  // how fast it fades

next_state = undefined;

// Camera shake
shake_timer = 0;
shake_strength = 0;

// Camera
cam = view_camera[0];

// Tilemap
var layer_id = layer_get_id("Tiles");

if (layer_id != -1) {
    tilemap = layer_tilemap_get_id(layer_id);

    if (tilemap == -1) {
        show_debug_message("ERROR: Layer found but no tilemap assigned!");
    }
} else {
    show_debug_message("ERROR: Tile layer missing!");
}

// Create particle system
ps = part_system_create();
part_system_depth(ps, -100); // draw above most things

// Create particle type
pt_spark = part_type_create();

// Big, bright sparks
part_type_shape(pt_spark, pt_shape_pixel);

// Much larger 
part_type_size(pt_spark, 1.2, 5.5, 0, 0);

// Bright flash in -> fade out
part_type_alpha3(pt_spark, 0, 1, 0);

// Bright colors
part_type_color2(pt_spark, c_white, c_white);

// Longer Life
part_type_life(pt_spark, 20, 40);

// Faster explosion
part_type_speed(pt_spark, 3, 7, 0, 0);

// Full radial burst
part_type_direction(pt_spark, 0, 360, 0, 0);

// Sligh float
part_type_gravity(pt_spark, 0.08, 270);

// Glow effect
part_type_blend(pt_spark, true);

// Play game start sound
audio_play_sound(snd_game_start, 1, false);
music_id = audio_play_sound(snd_music, 1, true);
audio_sound_gain(snd_music, 1, 120);

