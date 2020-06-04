/// @description draw victory text
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_noAA);
if(health > 0){
	draw_text_transformed(x + sprite_width * 0.5, y + sprite_height * 0.5, "VICTORY!", 25, 25, 0);
} else {
	draw_text_transformed(x + sprite_width * 0.5, y + sprite_height * 0.5, "YOU DIED!", 25, 25, 0);
}