/// @description draw the correct amount of keys on the door
draw_self();
keys = instance_number(obj_key);

if(keys == 1){
	draw_sprite_ext(spr_keyNums, 0, x, y, 3, 3, 0, c_white, 1);
} else if (keys == 2){
	draw_sprite_ext(spr_keyNums, 1, x, y, 3, 3, 0, c_white, 1);
} else if (keys == 3){
	draw_sprite_ext(spr_keyNums, 2, x, y, 3, 3, 0, c_white, 1);
}