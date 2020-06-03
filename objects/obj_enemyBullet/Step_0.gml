/// @description move forward, unless we hit a wall/ player
//need to fix in order to not hit player
var _list = ds_list_create();

//horizontal collision checking
if(instance_place_list(x + xVel, y, obj_wall, _list, false) != 0){
	var playerInList = false;
	if(obj_player.invincibleFrameCount == 0){
		for(var i = 0; i < ds_list_size(_list); i++){
			if(_list[|i].object_index == obj_player){
				playerInList = true;
			}
		}
	}
	if(playerInList){
		health --;
		obj_player.invincibleFrameCount = obj_player.invincibleFrameCountMax;
	}
	instance_destroy(id);
}

//vertical collision checking
if(instance_place_list(x, y + yVel, obj_wall, _list, false) != 0){
	var playerInList = false;
	if(obj_player.invincibleFrameCount == 0){
		for(var i = 0; i < ds_list_size(_list); i++){
			if(_list[|i].object_index == obj_player){
				playerInList = true;
			}
		}
	}
	if(playerInList){
		health --;
		obj_player.invincibleFrameCount = obj_player.invincibleFrameCountMax;
	}
	instance_destroy(id);
}

x += xVel;
y += yVel;