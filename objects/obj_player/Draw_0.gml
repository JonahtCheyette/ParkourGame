/// @description gravity gun pointer
pointerX = x;
pointerY = y;
pointerDir = -point_direction(x, y, mouse_x, mouse_y);
lowestDist = 100000000000;
index = 0;

//my raymarching thing for pointer
while(lowestDist >= 0.01 && index < 100){
	lowestDist = 100000000000;
	ds_list_clear(distanceList);
	with(obj_ground){
		//check if the wall is onscreen
		if(x - sprite_xoffset >= camera_get_view_x(view_camera[0]) && x - sprite_xoffset + sprite_width <= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) && y - sprite_yoffset >= camera_get_view_y(view_camera[0]) && y - sprite_yoffset + sprite_height <= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])){
			//if so, put the distance to them into the 
			ds_list_add(other.distanceList, distance_to_point(other.pointerX, other.pointerY));
		}
	}
	if(ds_list_empty(distanceList)){
		draw_set_color(c_red);
		draw_set_alpha(0.5);
		draw_line(x, y, x + (mouse_x - x) * 1000, y + (mouse_y - y) * 1000);
		draw_set_alpha(1);
		lowestDist = 0;
	} else {
		for(var i = 0; i < ds_list_size(distanceList); i++){
			if(distanceList[|i] < lowestDist){
				lowestDist = distanceList[|i]
			}
		}
		draw_set_color(c_red);
		draw_set_alpha(0.5);
		draw_line(pointerX, pointerY, pointerX + dcos(pointerDir) * lowestDist, pointerY + dsin(pointerDir) * lowestDist);
		pointerX += dcos(pointerDir) * lowestDist;
		pointerY += dsin(pointerDir) * lowestDist;
		draw_set_alpha(1);
	}
	index++;
}

draw_self();