/// @description Draw yourself
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0, room_width, room_height, false);
draw_set_alpha(1);

draw_set_color(c_dkgray);
draw_roundrect(camera_get_view_x(view_camera[0]) + 640, camera_get_view_y(view_camera[0]) + 508, camera_get_view_x(view_camera[0]) + 1408, camera_get_view_y(view_camera[0]) + 1028, false);
draw_set_color(c_black);
draw_roundrect(camera_get_view_x(view_camera[0]) + 640, camera_get_view_y(view_camera[0]) + 508, camera_get_view_x(view_camera[0]) + 1408, camera_get_view_y(view_camera[0]) + 1028, true);

for(var i = 0; i < 4; i++){
	draw_set_color(c_gray);
	if(i == buttonPressed){
		draw_set_color(make_colour_rgb(107, 107, 107));
	}
	draw_roundrect(camera_get_view_x(view_camera[0]) + 680, camera_get_view_y(view_camera[0]) + 628 + 100 * i, camera_get_view_x(view_camera[0]) + 1368, camera_get_view_y(view_camera[0]) + 708 + 100 * i, false);
}

draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_noAA);
draw_text_transformed(camera_get_view_x(view_camera[0]) + 1024, camera_get_view_y(view_camera[0]) + 568, "PAUSE", 4, 4, 0);
draw_text_transformed(camera_get_view_x(view_camera[0]) + 1024, camera_get_view_y(view_camera[0]) + 668, "SAVE & QUIT", 3, 3, 0);
draw_text_transformed(camera_get_view_x(view_camera[0]) + 1024, camera_get_view_y(view_camera[0]) + 768, "QUIT TO MENU", 3, 3, 0);
draw_text_transformed(camera_get_view_x(view_camera[0]) + 1024, camera_get_view_y(view_camera[0]) + 868, "DELETE SAVE", 3, 3, 0);
draw_text_transformed(camera_get_view_x(view_camera[0]) + 1024, camera_get_view_y(view_camera[0]) + 968, "EXIT MENU", 3, 3, 0);