// Check for animals inside pen
with (obj_animal) {

    if (place_meeting(x, y, other)) {

        other.saved_count++;
        global.points += 100;

        instance_destroy();
    }
}