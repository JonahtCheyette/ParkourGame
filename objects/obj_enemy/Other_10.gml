/// @description Fire
instance_create_layer(x, y, "Instances", obj_enemyBullet);
//find the instance we just made because instance_list is sorted arbitrarily
var bullet = noone;
for(var i = 0; i < instance_number(obj_enemyBullet); i++){
	var _inst = instance_find(obj_enemyBullet, i);
	if(point_distance(x, y, _inst.x, _inst.y) < 1){
		bullet = _inst;
	}
}

//check if we found one
if(bullet != noone){
	//if we did
	bullet.image_angle = angle;
	bullet.xVel = lengthdir_x(bullet.spd, angle);
	bullet.yVel = lengthdir_y(bullet.spd, angle);
	while(place_meeting(x, y, bullet)){
		bullet.x += lengthdir_x(1, angle);
		bullet.y += lengthdir_y(1, angle);
	}
}