/// @description Attract obj_useGravity
if(timer == 0){
	isDead = true;
}
if(!isDead){
	for(var i = 0; i < instance_number(obj_useGravity); i++){
		var object = instance_find(obj_useGravity, i);
		var f = 0;
		if(! collision_circle(x, y, baseRadius, obj_player, false, true)){
			f = 250000/sqr(point_distance(object.x, object.y, x, y));
			if(attractive){
				object.velocity[0] += lengthdir_x(f, point_direction(object.x, object.y, x, y));
				object.velocity[1] += lengthdir_y(f, point_direction(object.x, object.y, x, y));
			} else {
				object.velocity[0] -= lengthdir_x(f, point_direction(object.x, object.y, x, y));
				object.velocity[1] -= lengthdir_y(f, point_direction(object.x, object.y, x, y));
			}
		} else {
			isDead = true;
		}
	}
	
	
	//change radius
	rBoost += rDir;
	
	//switch radius change direction
	if(rBoost == rBoostMax || rBoost == 0){
		rDir *= -1;
	}
}

if(isDead && ds_list_size(particles) == 0){
	ds_list_destroy(particles);
	instance_destroy(id);
}