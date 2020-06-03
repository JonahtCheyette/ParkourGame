/// @description draw health
for(var i = 0; i < health; i++){
	draw_sprite(spr_health, 0,camera_get_view_x(view_camera[0]) + 5 + i * 50, camera_get_view_y(view_camera[0]) + 5);
}
