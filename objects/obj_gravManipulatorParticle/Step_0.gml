/// @description Check if dead, rotate, move
if(timer == 0){
	isDead = true;
} else {
	timer --;
}

rot += rDir;

x += xVel;
y += yVel;

xVel *= 0.8;
yVel *= 0.8;