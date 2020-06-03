/// @description Draw all the text
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_noAA);
draw_text_transformed(x, y - 165, "CONTROLS", 3, 3, 0);
draw_text_transformed(x, y - 110, "MOVE: WASD", 3, 3, 0);
draw_text_transformed(x, y - 55, "SHOOT: left-click", 3, 3, 0);
draw_text_transformed(x, y, "SWITCH: right-click", 3, 3, 0);
draw_text_transformed(x, y + 55, "DESTROY GRAVITY EMITTERS: spacebar", 3, 3, 0);
draw_text_transformed(x, y + 110, "TOGGLE FULLSCREEN: F", 3, 3, 0);
draw_text_transformed(x, y + 165, "PAUSE: Esc", 3, 3, 0);