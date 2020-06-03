/// @description Initialize Variables
//controls
xaxis = 0;
yaxis = 0;
spd = 1;

//physics
velocity = [0,0];
acceleration = [0,0];

//are the bullets attractive or repulsive
attractiveBullets = true;

//are you invincible due to the end of the level
levelOver = false;

//health and invincibility
health = 3;
invincibleFrameCount = 0;
invincibleFrameCountMax = 300;

//start up the laser pointer
pointerX = x;
pointerY = y;