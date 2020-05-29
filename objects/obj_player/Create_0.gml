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
//right click for toggling between attraction and repulsion: DONE
//left click for shoot : DONE
//add a slight delay between shots:Doing
bulletCooldown = 0;