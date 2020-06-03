/// @description move around
velocity[0] *= 0.9;
velocity[1] *= 0.9;
//limit velocity
var velMag = point_distance(0,0, velocity[0], velocity[1]);
if(velMag > 10){
	velocity[0] *= 10 / velMag;
	velocity[1] *= 10 / velMag;
}
velMag = point_distance(0,0, velocity[0], velocity[1]);
//horizontal collision checking
if(place_meeting(x + velocity[0], y, obj_wall)){
	while(!place_meeting(x + sign(velocity[0]), y, obj_wall)){
		x += sign(velocity[0]);
	}
	velocity[0] = 0;
	//destroy yourself if you slam into a wall too hard
	if (velMag > 9){
		instance_destroy(id);
	}
}
if(x - sprite_xoffset + velocity[0] < 0){
	while(x - sprite_xoffset + sign(velocity[0]) >= 0){
		x += sign(velocity[0]);
	}
	velocity[0] = 0;
}
if(x - sprite_xoffset + sprite_width + velocity[0] > room_width){
	while(x - sprite_xoffset + sprite_width + sign(velocity[0]) <= room_width){
		x += sign(velocity[0]);
	}
	velocity[0] = 0;
}

//vertical collision checking
if(place_meeting(x, y + velocity[1], obj_wall)){
	while(!place_meeting(x, y + sign(velocity[1]), obj_wall)){
		y += sign(velocity[1]);
	}
	velocity[1] = 0;
	//destroy yourself if you slam into a wall too hard
	if (velMag > 9){
		instance_destroy(id);
	}
}
if(y - sprite_yoffset + velocity[1] < 0){
	while(y - sprite_yoffset + sign(velocity[1]) >= 0){
		y += sign(velocity[1]);
	}
	velocity[1] = 0;
}
if(y - sprite_yoffset + sprite_height + velocity[1] > room_height){
	while(y - sprite_yoffset + sprite_height + sign(velocity[1]) <= room_height){
		y += sign(velocity[1]);
	}
	velocity[1] = 0;
}

//add velocity to position
x += velocity[0];
y += velocity[1];

//handle firing the gun
var _list = ds_list_create();
collision_line_list(x, y, obj_player.x, obj_player.y, obj_wall, false, true, _list, false);
if(ds_list_size(_list) == 1 && _list[|0].object_index == obj_player){
	aim = point_direction(x, y, obj_player.x, obj_player.y);
	angle -= angle_difference(angle, aim) / 4;
	if(firingTimer == 0){
		//fire
		event_user(0);
		firingTimer = firingTimerMax;
	}
}

if(firingTimer > 0){
	firingTimer --;
}