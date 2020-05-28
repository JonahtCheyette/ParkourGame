/// @description Movement
//getting input, resetting acceleration for this frame
getInput();
acceleration = [0,0];

//gravity gun

//basic movement
acceleration[0] = spd * xaxis;
acceleration[1] = spd * yaxis;

//add acceleration to velocity
velocity[0] += acceleration[0];
velocity[1] += acceleration[1];

//horizontal collision checking
if(place_meeting(x + velocity[0], y, obj_ground)){
	while(!place_meeting(x + sign(velocity[0]), y, obj_ground)){
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
if(place_meeting(x, y + velocity[1], obj_ground)){
	while(!place_meeting(x, y + sign(velocity[1]), obj_ground)){
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

//limit the velocity
velocity[0] = clamp(velocity[0], -10*spd, 10*spd);
velocity[1] = clamp(velocity[1], -10*spd, 10*spd);
//add velocity to position
x += velocity[0];
y += velocity[1];
