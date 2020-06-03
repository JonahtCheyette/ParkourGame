/// @description Move the key according to animation
if(!instance_exists(obj_pauseMenu)){
	if(a > 360){
		a = 0;
	}
	a += 2;
	y = ystart + 8 * dsin(a);
}