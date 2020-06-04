/// @description turn on the menu if it's off
if(room != rm_mainMenu){
	if(instance_exists(obj_pauseMenu)){
		instance_destroy(obj_pauseMenu);
	} else {
		instance_create_layer(0, 0, "Instances", obj_pauseMenu);
	}
}