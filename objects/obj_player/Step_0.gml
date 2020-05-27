/// @description Movement
//getting input, resetting acceleration for this frame
getInput();
acceleration = [0,0];

//jumping
if(grounded){
	if(yaxis == -1 || keyboard_check(vk_space)){
		acceleration[1] -= jumpPower;
	}
}

//gravity
if(!grounded){
	acceleration[1] += 2;
}

acceleration[0] = spd * xaxis;
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
//vertical collision checking
if(place_meeting(x, y + velocity[1], obj_ground)){
	while(!place_meeting(x, y + sign(velocity[1]), obj_ground)){
		y += sign(velocity[1]);
	}
	velocity[1] = 0;
	if(place_meeting(x, y + 1, obj_ground)){
		grounded = true;
	} else {
		grounded = false;
	}
} else {
	grounded = false;
}

//slow down the player if there's no x input
if(grounded){
	if(xaxis == 0){
		velocity[0] *= 0.2;
	}
}

//limit the velocity
velocity[0] = clamp(velocity[0], -2*spd, 2*spd);
velocity[1] = clamp(velocity[1], -jumpPower*2.5, jumpPower*2.5);
//add velocity to position
x += velocity[0];
y += velocity[1];
