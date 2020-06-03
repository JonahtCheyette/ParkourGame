/// @description draw self and gun
draw_self();
draw_sprite_ext(spr_enemyGun, 0, x, y, 1, 1, angle, c_white, 1);
for(var i = 0; i < firingTimer; i++){
	draw_sprite_ext(spr_reload, 0, x + lengthdir_x(i - 8, angle), y + lengthdir_y(i - 8, angle), 1, 1, angle, c_white, 1);
}
