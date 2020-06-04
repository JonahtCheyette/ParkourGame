/// @description Check if the player has finished the level
if(!instance_exists(obj_pauseMenu)){
	if(sprite_index = spr_levelEndAnimation && image_index == 5){
		with(obj_player){
			levelOver = false;
		}
		room = rm;
		
	}
}
