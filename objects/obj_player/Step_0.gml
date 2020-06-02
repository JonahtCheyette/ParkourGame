/// @description Movement
//getting input, resetting acceleration for this frame
getInput();
acceleration = [0,0];

//gravity gun
if(mouse_check_button_pressed(mb_right)){
	attractiveBullets = !attractiveBullets
}

if(mouse_check_button_pressed(mb_left)){
	event_user(0);
}

if(yaxis == -1){
	//not sure if this works the way I think it does
	with(obj_levelEnd){
		if(keys == 0 && place_meeting(x, y, obj_player)){
			other.levelOver = true;
			sprite_index = spr_levelEndAnimation;
		}
	}
}


//basic movement
acceleration[0] = spd * xaxis;
acceleration[1] = spd * yaxis;

//add acceleration to velocity, limit velocity
var velMag = point_distance(0,0, velocity[0], velocity[1]);
if(velMag <= 10 * spd){
	velocity[0] += acceleration[0];
	velocity[1] += acceleration[1];
	velMag = point_distance(0,0, velocity[0], velocity[1]);
	if(velMag > 10 * spd){
		velocity[0] *= 10 * spd / velMag;
		velocity[1] *= 10 * spd / velMag;
	}
} else if(velMag > 30*spd){
	velocity[0] *= 30 * spd / velMag;
	velocity[1] *= 30 * spd / velMag;
}

//horizontal collision checking
if(place_meeting(x + velocity[0], y, obj_wall)){
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

//slow down the player if there's no input
if(xaxis == 0){
	velocity[0] *= 0.9;
}
if(yaxis == 0){
	velocity[1] *= 0.9;
}

//add velocity to position
if(!levelOver){
	x += velocity[0];
	y += velocity[1];
} else {
	//the level is over, stop moving
	velocity = [0,0];
}
