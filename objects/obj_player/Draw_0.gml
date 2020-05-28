/// @description gravity gun pointer
pointerX = x;
pointerY = y;
pointerDir = -point_direction(x, y, mouse_x, mouse_y);
lowestDist = 100000000000;
index = 0;
pWall = noone;
wall = noone

//my raymarching thing for pointer
while(lowestDist >= 0.01 && index < 100){
	lowestDist = 100000000000;
	pWall = wall;
	wall = instance_nearest(pointerX, pointerY, obj_ground);
	//check if the wall exists
	if(wall != noone){
		if((wall.x - wall.sprite_xoffset + wall.sprite_width >= camera_get_view_x(view_camera[0]) || wall.x - wall.sprite_xoffset <= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) && (wall.y - wall.sprite_yoffset + wall.sprite_height >= camera_get_view_y(view_camera[0]) || wall.y - wall.sprite_yoffset <= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
			//if so get distance
			with(wall){
				other.lowestDist = distance_to_point(other.pointerX, other.pointerY);
			}
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			draw_line_width(pointerX, pointerY, pointerX + dcos(pointerDir) * lowestDist, pointerY + dsin(pointerDir) * lowestDist, 3);
			pointerX += dcos(pointerDir) * lowestDist;
			pointerY += dsin(pointerDir) * lowestDist;
			draw_set_alpha(1);
		} else {
			//else we don't care
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			draw_line_width(x, y, x + (mouse_x - x) * 1000, y + (mouse_y - y) * 1000,3);
			draw_set_alpha(1);
			lowestDist = -1;
		}
	} else {
		if(index == 0){
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			draw_line_width(x, y, x + (mouse_x - x) * 1000, y + (mouse_y - y) * 1000,3);
			draw_set_alpha(1);
			lowestDist = -1;
		}
	}
	index++;
}
if(lowestDist >= 0 && lowestDist <= 0.01){
	draw_sprite_part_ext(spr_laserPointer, 0, (pWall.x - pWall.sprite_xoffset) - (pointerX - 33*0.5), (pWall.y - pWall.sprite_yoffset) - (pointerY - 33*0.5), 99, 99, pointerX - 49, pointerY - 49, 1/3, 1/3, c_white, 1);
}


draw_self();