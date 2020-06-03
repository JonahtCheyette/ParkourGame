/// @description move forward, unless we hit a wall
var destroyed = false;

//need to fix in order to not hit player
var _list = ds_list_create();

//horizontal collision checking
if(instance_place_list(x + xVel, y, obj_wall, _list, false) != 0){
	var playerInList = false;
	for(var i = 0; i < ds_list_size(_list); i++){
		if(_list[|i].object_index == obj_player){
			playerInList = true;
		}
	}
	if(playerInList){
		if(ds_list_size(_list) != 1){
			//check, but make sure we aren't checking the player
			var onlyHitPlayer = true;
			while(instance_place_list(x + sign(xVel), y, obj_wall, _list, false) == 0 && onlyHitPlayer){
				if(ds_list_size(_list) == 1 && _list[|0].object_index == obj_player){
					//only Hit The player
					x += sign(xVel);
				} else {
					onlyHitPlayer = false;
				}
			}
			//at wall
			if(!onlyHitPlayer){
				destroyed = true;
			}
		}
	} else {
		while(instance_place_list(x + sign(xVel), y, obj_wall, _list, false) == 0){
			x += sign(xVel);
		}
		//at wall
		destroyed = true;
	}
}

//vertical collision checking
if(instance_place_list(x, y + yVel, obj_wall, _list, false) != 0){
	var playerInList = false;
	for(var i = 0; i < ds_list_size(_list); i++){
		if(_list[|i].object_index == obj_player){
			playerInList = true;
		}
	}
	if(playerInList){
		if(ds_list_size(_list) != 1){
			//check, but make sure we aren't checking the player
			var onlyHitPlayer = true;
			while(instance_place_list(x, y + sign(yVel), obj_wall, _list, false) == 0 && onlyHitPlayer){
				if(ds_list_size(_list) == 1 && _list[|0].object_index == obj_player){
					//only Hit The player
					y += sign(yVel);
				} else {
					onlyHitPlayer = false;
				}
			}
			//at wall
			if(!onlyHitPlayer){
				destroyed = true;
			}
		}
	} else {
		while(instance_place_list(x, y + sign(yVel), obj_wall, _list, false) == 0){
			y += sign(yVel);
		}
		//at wall
		destroyed = true
	}
}

if(destroyed){
	instance_destroy(id);
}


x += xVel;
y += yVel;