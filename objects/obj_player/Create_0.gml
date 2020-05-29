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

//for handling bullets
bulletList = ds_list_create();
bulletCooldown = 0;