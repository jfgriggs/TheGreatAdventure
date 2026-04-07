var p = oPlayer;

//depth = -y;
// Depth
depth = -bbox_bottom;

with (oWall)
{
    var target = 1;

    if (instance_exists(p))
    {
        if (
            p.x > bbox_left &&
            p.x < bbox_right &&
            p.y > bbox_top &&
            p.y < bbox_bottom
        )
        {
            target = 0.65;
        }
    }

    image_alpha = lerp(image_alpha, target, 0.2);
}