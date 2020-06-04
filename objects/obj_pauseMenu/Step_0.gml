/// @description Make sure we haven't switched to a menu page
if(room == rm_mainMenu){
	instance_destroy(id);
}
if(mouse_check_button_pressed(mb_left)){
	buttonPressed = -1;
	if(mouse_x >= camera_get_view_x(view_camera[0]) + 680 && mouse_x <= camera_get_view_x(view_camera[0]) + 1368){
		if(mouse_y >= camera_get_view_y(view_camera[0]) + 628 && mouse_y <= camera_get_view_y(view_camera[0]) + 708){
			//save & quit
			buttonPressed = 0;
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 728 && mouse_y <= camera_get_view_y(view_camera[0]) + 808){
			//quit to menu
			buttonPressed = 1;
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 828 && mouse_y <= camera_get_view_y(view_camera[0]) + 908){
			//load
			buttonPressed = 2;
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 928 && mouse_y <= camera_get_view_y(view_camera[0]) + 1008){
			//exit menu
			buttonPressed = 3;
		}
	}
}

if(mouse_check_button_released(mb_left)){
	buttonPressed = -1;
	if(mouse_x >= camera_get_view_x(view_camera[0]) + 680 && mouse_x <= camera_get_view_x(view_camera[0]) + 1368){
		if(mouse_y >= camera_get_view_y(view_camera[0]) + 628 && mouse_y <= camera_get_view_y(view_camera[0]) + 708){
			//save & quit
			ini_open("save.ini");
			ini_write_real("Location", "Room", room);
			ini_close();
			game_end();
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 728 && mouse_y <= camera_get_view_y(view_camera[0]) + 808){
			//quit to menu
			room = rm_mainMenu;
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 828 && mouse_y <= camera_get_view_y(view_camera[0]) + 908 && file_exists("save.ini")){
			//load
			file_delete("save.ini");
			instance_destroy(id);
		} else if (mouse_y >= camera_get_view_y(view_camera[0]) + 928 && mouse_y <= camera_get_view_y(view_camera[0]) + 1008){
			//exit menu
			instance_destroy(id);
		}
	}
}