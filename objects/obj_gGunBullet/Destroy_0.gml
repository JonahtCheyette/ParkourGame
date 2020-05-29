/// @description create gravity manipulator
instance_create_layer(x, y,"Under", obj_gravityManipulator);
//find the instance we just made because instance_list is sorted arbitrarily
var found = noone;
for(var i = 0; i < instance_number(obj_gravityManipulator); i++){
	var _inst = instance_find(obj_gravityManipulator, i);
	if(point_distance(x, y, _inst.x, _inst.y) < 1){
		found = _inst;
	}
}

//check if we found one
if(found != noone){
	//if we did
	found.attractive = attractive;
}