/// @description move forward, unless we hit a wall

//horizontal collision checking
if(place_meeting(x + xVel, y, obj_wall)){
	while(!place_meeting(x + sign(xVel), y, obj_wall)){
		x += sign(xVel);
	}
	//at wall
	instance_destroy(id);
}

//vertical collision checking
if(place_meeting(x, y + yVel, obj_wall)){
	while(!place_meeting(x, y + sign(yVel), obj_wall)){
		y += sign(yVel);
	}
	//at wall
	instance_destroy(id);
}

x += xVel;
y += yVel;