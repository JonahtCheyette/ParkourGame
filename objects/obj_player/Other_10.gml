/// @description Shoot gravity gun
instance_create_layer(x, y, "Instances", obj_gGunBullet);
//find the instance we just made because instance_list is sorted arbitrarily
var bullet = noone;
for(var i = 0; i < instance_number(obj_gGunBullet); i++){
	var _inst = instance_find(obj_gGunBullet, i);
	if(point_distance(x, y, _inst.x, _inst.y) < 1){
		bullet = _inst;
	}
}

//check if we found one
if(bullet != noone){
	//if we did
	bullet.rot = -pointerDir;
	bullet.xVel = lengthdir_x(bullet.spd, bullet.rot);
	bullet.yVel = lengthdir_y(bullet.spd, bullet.rot);
	bullet.attractive = attractiveBullets;
	for(var i = instance_number(obj_gravityManipulator) - 1; i >= 0; i--){
		var _inst = instance_find(obj_gravityManipulator, i);
		if(_inst.attractive == bullet.attractive){
			_inst.isDead = true;
		}
	}
	
	for(var i = instance_number(obj_gGunBullet) - 1; i >= 0; i--){
		var _inst = instance_find(obj_gGunBullet, i);
		if(_inst.attractive == bullet.attractive && bullet != _inst){
			instance_destroy(_inst, false);
		}
	}
}