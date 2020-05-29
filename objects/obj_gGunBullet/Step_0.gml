/// @description move forward, unless we hit a wall

//horizontal collision checking
if(place_meeting(x + xVel, y, obj_ground)){
	while(!place_meeting(x + sign(xVel), y, obj_ground)){
		x += sign(xVel);
	}
	//at wall
	instance_destroy(id);
}

//vertical collision checking
if(place_meeting(x, y + yVel, obj_ground)){
	while(!place_meeting(x, y + sign(yVel), obj_ground)){
		y += sign(yVel);
	}
	//at wall
	instance_destroy(id);
}

x += xVel;
y += yVel;