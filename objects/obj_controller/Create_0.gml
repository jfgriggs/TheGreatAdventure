// =============================================================================
// OBJECT:       obj_controller
// EVENT:        Create
// REVISION:     1.1.0
// SYSTEM:       Core Game Controller
// ARCHITECTURE: Central Game Coordinator
//
// DESCRIPTION:
// Initializes global game systems, controller-owned resources, camera,
// tilemap, particles, audio, and initial world population.
//
// =============================================================================

// -----------------------------------------------------------------------------
// Revision History
// -----------------------------------------------------------------------------
//
// 1.1.0
// • Standardized file header.
// • Standardized section headers.
// • Removed duplicate tile_check_blocking configuration from animal spawning.
// • Updated documentation.
//
// 1.0.0
// • Initial implementation.
//

/// @description
/// Initializes high-level game systems and controller-owned resources.

// -----------------------------------------------------------------------------
// Global Variables
// -----------------------------------------------------------------------------
Globals_Initialize();

// Cache controller instance for shared systems.
global.controller = id;

// Initial player spawn location.
global.player_spawn_x = 1000;
global.player_spawn_y = 250;

spawn_player_pending = true;

// -----------------------------------------------------------------------------
// Screen Fade
// -----------------------------------------------------------------------------

// 1 = fully black
// 0 = fully visible
fade_alpha  = 0.5;
fade_target = 1.0;
fade_speed  = 0.05;

next_state = undefined;

// -----------------------------------------------------------------------------
// Camera
// -----------------------------------------------------------------------------

shake_timer = 0;
shake_strength = 0;

cam = view_camera[0];

// -----------------------------------------------------------------------------
// Tilemap
// -----------------------------------------------------------------------------

var layer_id = layer_get_id("Tiles");

if (layer_id != -1)
{
    tilemap = layer_tilemap_get_id(layer_id);

    if (tilemap == -1)
    {
        show_debug_message("ERROR: Layer found but no tilemap assigned!");
    }
}
else
{
    show_debug_message("ERROR: Tile layer missing!");
}

// -----------------------------------------------------------------------------
// Particle Systems
// -----------------------------------------------------------------------------

ps = part_system_create();
part_system_depth(ps, -100);

pt_spark = part_type_create();

part_type_shape(pt_spark, pt_shape_pixel);

part_type_size(pt_spark, 1.2, 5.5, 0, 0);

part_type_alpha3(pt_spark, 0, 1, 0);

part_type_color2(pt_spark, c_white, c_white);

part_type_life(pt_spark, 20, 40);

part_type_speed(pt_spark, 3, 7, 0, 0);

part_type_direction(pt_spark, 0, 360, 0, 0);

part_type_gravity(pt_spark, 0.08, 270);

part_type_blend(pt_spark, true);

// -----------------------------------------------------------------------------
// Audio
// -----------------------------------------------------------------------------

if (!variable_global_exists("music_id")
|| !audio_is_playing(global.music_id))
{
    global.music_id = audio_play_sound(snd_music, 1, true);
    audio_sound_gain(snd_music, 1, 120);
}

// -----------------------------------------------------------------------------
// Animal Spawning
// -----------------------------------------------------------------------------

var animal_spawns =
[
    {
        animal_type: ANIMAL.CHICKEN,
        count: 8
    },

    {
        animal_type: ANIMAL.COW,
        count: 4
    },

    {
        animal_type: ANIMAL.PIG,
        count: 4
    },

    {
        animal_type: ANIMAL.SHEEP,
        count: 4
    }
];

Animal_Spawn(animal_spawns);