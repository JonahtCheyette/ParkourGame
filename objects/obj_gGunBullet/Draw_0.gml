/// @description color the bullet appropriately
if(attractive){
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, rot, c_green, 1);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, rot, c_red, 1);
}