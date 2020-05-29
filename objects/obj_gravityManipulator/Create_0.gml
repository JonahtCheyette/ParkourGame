/// @description Initialize stuff for animation, death
timer = 60;

attractive = false;

//things to make the radius slightly shrink or grow
//rBoost is the thing we add to the radius, rDir determines whether it's growing or shrinking
rBoost = 4;
rDir = 0.5;

baseRadius = 20;
rBoostMax = 8;

//handle particle effects
particles = ds_list_create();

//for letting the particles fade out
isDead = false;