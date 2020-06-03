/// @description draw yourself
draw_set_alpha(deathTimer/60);
draw_set_color(c_red);
draw_rectangle(x, y, x + 65, y + 65, false);
draw_sprite_ext(spr_whyNoRotatedRectangle, 0, x + 32, y + 32, 1, 1, angle, c_white, deathTimer/60);
draw_set_alpha(1);