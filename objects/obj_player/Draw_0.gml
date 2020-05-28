/// @description gravity gun pointer
pointerX = x;
pointerY = y;
var pointerDir = -point_direction(x, y, mouse_x, mouse_y);
lowestDist = 100000000000;
var wall = noone
//NESW order
var circleScale = 5;


if(noone == collision_line(x, y, x + dcos(pointerDir) * 1000, y + dsin(pointerDir) * 1000, obj_ground, false, true)){
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_line_width(x, y, x + dcos(pointerDir) * 1000, y + dsin(pointerDir) * 1000,3);
	draw_set_alpha(1);
} else {
	//my raymarching thing
	//check if we've hit a wall or if pointer is offscreen
	while(lowestDist >= 0.01 && !(pointerX <= camera_get_view_x(view_camera[0]) || pointerX >= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) || pointerY <= camera_get_view_y(view_camera[0]) || pointerY >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
		lowestDist = 100000000000;
		for(var i = 0; i < instance_number(obj_ground); i++){
			with(instance_find(obj_ground, i)){
				if(instance_nearest(other.pointerX, other.pointerY, obj_ground) != noone){
					if(distance_to_point(other.pointerX, other.pointerY) < other.lowestDist){
						other.lowestDist = distance_to_point(other.pointerX, other.pointerY);
					}
				} else {
					other.lowestDist = 0;
				}
			}
		}
		pointerX += dcos(pointerDir) * lowestDist;
		pointerY += dsin(pointerDir) * lowestDist;
	}
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_line_width(x, y, pointerX, pointerY,3);
	draw_set_alpha(1);
	//terribleness to draw the pointer
	if(!(pointerX <= camera_get_view_x(view_camera[0]) || pointerX >= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) || pointerY <= camera_get_view_y(view_camera[0]) || pointerY >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
		var _list = ds_list_create();
		var _num = collision_circle_list(pointerX, pointerY, 99*0.5/circleScale, obj_ground, false, true, _list, false);
		var up = ds_list_create();
		var left = ds_list_create();
		var right = ds_list_create();
		var down = ds_list_create();
		for(var i = 0; i < _num; i++){
			wall = _list[|i];
			ds_list_add(up, max(0, (wall.y - wall.sprite_yoffset) - (pointerY - 99*0.5/circleScale)));
			ds_list_add(right, max(0, (pointerX + 99*0.5/circleScale) - (wall.x - wall.sprite_xoffset + wall.sprite_width)));
			ds_list_add(down, max(0, (pointerY + 99*0.5/circleScale) - (wall.y - wall.sprite_yoffset + wall.sprite_height)));
			ds_list_add(left, max(0,(wall.x - wall.sprite_xoffset) - (pointerX - 99*0.5/circleScale)));
			draw_sprite_part_ext(spr_laserPointer, 0, left[|i] * circleScale, up[|i] * circleScale, 99 - circleScale * (left[|i] + right[|i]), 99 - circleScale * (up[|i] + down[|i]), pointerX + left[|i] - 99*0.5/circleScale, pointerY + up[|i] - 99*0.5/circleScale, 1/circleScale, 1/circleScale, c_white, 1);
		}
	}
}

draw_self();