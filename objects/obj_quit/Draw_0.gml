/// @description Draw the button
draw_set_color(c_gray);
draw_roundrect_ext(x,y, x + sprite_width, y + sprite_height, 30, 30, false);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_noAA);
draw_text_transformed(x + sprite_width * 0.5, y + sprite_height * 0.5, "QUIT", 2.5, 2.5, 0);