saved_count = 0;

// Optional: set from controller
target_count = 5;

function add_animal() {
    saved_count++;
    global.points += 100;

    // Check win condition
    if (saved_count >= target_count) {
        show_debug_message("LEVEL COMPLETE");
        
        // You can replace this later:
        // room_goto_next();
    }
}