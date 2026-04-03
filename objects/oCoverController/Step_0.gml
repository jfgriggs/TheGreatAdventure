var p = oPlayer;

depth = -y;

with (oWall)
{
    var target = 1;

    if (instance_exists(p))
    {
        if (
            p.x > bbox_left &&
            p.x < bbox_right &&
            p.y > y &&
            p.y < bbox_bottom
        )
        {
            target = 0.35;
        }
    }

    image_alpha = lerp(image_alpha, target, 0.2);
}