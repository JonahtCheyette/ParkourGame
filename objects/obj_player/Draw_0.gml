/// @description draw gravity gun, gravity gun pointer
pointerX = x;
pointerY = y;
pointerDir = -point_direction(x, y, mouse_x, mouse_y);
lowestDist = 100000000000;
var wall = noone
//NESW order
var circleScale = 5;

//need to decide on final colors
if(attractiveBullets){
	var col = c_green;
} else {
	var col = c_red;
}


//my raymarching thing
//check if we've hit a wall or if pointer is offscreen
while(lowestDist >= 0.01 && !(pointerX <= camera_get_view_x(view_camera[0]) || pointerX >= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) || pointerY <= camera_get_view_y(view_camera[0]) || pointerY >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
	//gonna try to optomise slightly
	lowestDist = 100000000000;
	if(instance_number(obj_ground) > 0){
		if(instance_nearest(other.pointerX, other.pointerY, obj_ground) != noone){
			for(var i = 0; i < instance_number(obj_ground); i++){
				with(instance_find(obj_ground, i)){
					if(distance_to_point(other.pointerX, other.pointerY) < other.lowestDist){
						other.lowestDist = distance_to_point(other.pointerX, other.pointerY);
					}
				}
			}
		} else {
			other.lowestDist = 0;
		}
	}
	
	if(instance_number(obj_gMovable) > 0){
		if(instance_nearest(other.pointerX, other.pointerY, obj_gMovable) != noone){
			for(var i = 0; i < instance_number(obj_gMovable); i++){
				with(instance_find(obj_gMovable, i)){
					if(distance_to_point(other.pointerX, other.pointerY) < other.lowestDist){
						other.lowestDist = distance_to_point(other.pointerX, other.pointerY);
					}
				}
			}
		} else {
			other.lowestDist = 0;
		}
	}
	
	if(instance_number(obj_enemy) > 0){
		if(instance_nearest(other.pointerX, other.pointerY, obj_enemy) != noone){
			for(var i = 0; i < instance_number(obj_enemy); i++){
				with(instance_find(obj_enemy, i)){
					if(distance_to_point(other.pointerX, other.pointerY) < other.lowestDist){
						other.lowestDist = distance_to_point(other.pointerX, other.pointerY);
					}
				}
			}
		} else {
			other.lowestDist = 0;
		}
	}
	
	pointerX += dcos(pointerDir) * lowestDist;
	pointerY += dsin(pointerDir) * lowestDist;
}
draw_set_alpha(0.5);
draw_set_color(col);
draw_line_width(x, y, pointerX, pointerY,3);
draw_set_alpha(1);
//terribleness to draw the pointer
//essentially gets the cuts of each wall the circle intersects, then draws a circle per each
//the idea itself ain't bad, but the math is horrendous
if(!(pointerX <= camera_get_view_x(view_camera[0]) || pointerX >= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) || pointerY <= camera_get_view_y(view_camera[0]) || pointerY >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))){
	var _list = ds_list_create();
	var _num = collision_circle_list(pointerX, pointerY, 99*0.5/circleScale, obj_wall, false, true, _list, false);
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
		draw_sprite_part_ext(spr_laserPointer, 0, left[|i] * circleScale, up[|i] * circleScale, 99 - circleScale * (left[|i] + right[|i]), 99 - circleScale * (up[|i] + down[|i]), pointerX + left[|i] - 99*0.5/circleScale, pointerY + up[|i] - 99*0.5/circleScale, 1/circleScale, 1/circleScale, col, 1);
	}
}

//draw myself
draw_self();

//handle Invincibility
if(invincibleFrameCount > 0){
	draw_set_alpha((sin(invincibleFrameCount * 0.5) * 0.3) + 0.3);
	draw_set_color(c_black);
	draw_rectangle(x - sprite_xoffset, y - sprite_yoffset, x - sprite_xoffset + sprite_width, y - sprite_yoffset + sprite_height, false);
	draw_set_alpha(1);
}

//draw gravity gun
draw_sprite_ext(spr_gravityGun, 0, x, y, 1, 1, -pointerDir, col, 1);