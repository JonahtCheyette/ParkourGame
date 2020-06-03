/// @description Death Animation
instance_create_layer(x - sprite_xoffset, y - sprite_yoffset, "Instances", obj_corpse);
//find the instance we just made because instance_list is sorted arbitrarily
var corpse = noone;
for(var i = 0; i < instance_number(obj_corpse); i++){
	var _inst = instance_find(obj_corpse, i);
	if(point_distance(x - sprite_xoffset, y - sprite_yoffset, _inst.x, _inst.y) < 1){
		corpse = _inst;
	}
}

if(corpse != noone){
	corpse.angle = angle;
}