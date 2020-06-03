/// @description Check if disappeared
if(!instance_exists(obj_pauseMenu)){
	if(deathTimer == 0){
		instance_destroy(id)
	}
	
	deathTimer--;
}
