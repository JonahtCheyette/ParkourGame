/// @description Attract obj_useGravity
if(timer == 0){
	isDead = true;
}
timer --;

//change radius
rBoost += rDir;

//switch radius change direction
if(rBoost == rBoostMax || rBoost == 0){
	rDir *= -1;
}

if(isDead && ds_list_size(particles) == 0){
	ds_list_destroy(particles);
	instance_destroy(id);
}