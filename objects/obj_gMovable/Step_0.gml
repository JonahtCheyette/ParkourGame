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
//for checking if killed an enemy
var _listx = ds_list_create();
var _listy = ds_list_create();
var onlyHitEnemies = true;
//horizontal collision checking
if(place_meeting(x + velocity[0], y, obj_wall)){
	instance_place_list(x + velocity[0], y, obj_wall, _listx, false);
	for(var i = 0; i < ds_list_size(_listx); i++){
		if(_listx[|i].object_index != obj_enemy){
			onlyHitEnemies = false;
		}
	}
	while(!place_meeting(x + sign(velocity[0]), y, obj_wall)){
		x += sign(velocity[0]);
	}
	velocity[0] = 0;
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
	instance_place_list(x, y + velocity[1], obj_wall, _listy, false);
	for(var i = 0; i < ds_list_size(_listy); i++){
		if(_listy[|i].object_index != obj_enemy){
			onlyHitEnemies = false;
		}
	}
	while(!place_meeting(x, y + sign(velocity[1]), obj_wall)){
		y += sign(velocity[1]);
	}
	velocity[1] = 0;
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

//kill all enemies if you only hit enemies
if(onlyHitEnemies){
	for(var i = ds_list_size(_listx) - 1; i >= 0; i--){
		instance_destroy(_listx[|i]);
		ds_list_delete(_listx,i);
	}
	for(var i = ds_list_size(_listy) - 1; i >= 0; i--){
		instance_destroy(_listy[|i]);
		ds_list_delete(_listy,i);
	}
}


//add velocity to position
x += velocity[0];
y += velocity[1];