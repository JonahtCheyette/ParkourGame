/// @description draw self based on attractive or not
if(!isDead){
	if(attractive){
		var col = c_green;
	} else {
		var col = c_red;
	}
	var scale = (baseRadius + rBoost)/baseRadius;
	draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, col, 1);

	while(ds_list_size(particles) < 15){
		if(attractive){
			ds_list_add(particles, instance_create_layer(x + lengthdir_x(random_range(baseRadius + rBoostMax + 1, baseRadius + rBoostMax + 3), random(360)), y + lengthdir_y(random_range(baseRadius + rBoostMax + 1, baseRadius + rBoostMax + 3), random(360)), "Under", obj_gravManipulatorParticle));
			var newParticle = particles[|(ds_list_size(particles) - 1)];
			newParticle.col = c_green;
			newParticle.xVel = lengthdir_x(random_range(1.6, 2) * point_distance(newParticle.x, newParticle.y, x, y)/newParticle.timer, point_direction(newParticle.x, newParticle.y, x, y));
			newParticle.yVel = lengthdir_y(random_range(1.6, 2) * point_distance(newParticle.x, newParticle.y, x, y)/newParticle.timer, point_direction(newParticle.x, newParticle.y, x, y));
		} else {
			ds_list_add(particles, instance_create_layer(x + lengthdir_x(random_range(baseRadius - 1, baseRadius - 3), random(360)), y + lengthdir_y(random_range(baseRadius - 1, baseRadius - 3), random(360)), "Under", obj_gravManipulatorParticle));
			var newParticle = particles[|(ds_list_size(particles) - 1)];
			newParticle.col = c_red;
			newParticle.xVel = lengthdir_x(random_range(1.6, 2) * point_distance(newParticle.x, newParticle.y, x, y)/newParticle.timer, point_direction(x, y, newParticle.x, newParticle.y));
			newParticle.yVel = lengthdir_y(random_range(1.6, 2) * point_distance(newParticle.x, newParticle.y, x, y)/newParticle.timer, point_direction(x, y, newParticle.x, newParticle.y));
		}
	}
}

for(var i = 0; i < ds_list_size(particles); i++){
	if(particles[|i].isDead){
		instance_destroy(particles[|i]);
		ds_list_delete(particles,i);
	}
}