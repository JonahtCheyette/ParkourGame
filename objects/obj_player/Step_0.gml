/// @description Movement
getInput();
acceleration = [0,0];

//right now grounded is only true a frame late, need actual collision handling
grounded = place_meeting(x,y + 1,obj_ground);

if(grounded){
	velocity[1] = 0;
	acceleration[1] = 0;
	if(yaxis == -1){
		acceleration[1] = jumpPower * yaxis;
	}
}

if(!grounded){
	acceleration[1] += 2;
}

acceleration[0] = spd * xaxis;

velocity[0] += acceleration[0];
velocity[1] += acceleration[1];
velocity[0] = constrain(velocity[0], -1.5*spd, 1.5*spd);
velocity[1] = constrain(velocity[1], -jumpPower*2.5, jumpPower*2.5);
x += velocity[0];
y += velocity[1];
