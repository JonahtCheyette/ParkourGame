/// @description decide where we're aiming
aim = point_direction(x, y, obj_player.x, obj_player.y);
angle = aim;
velocity = [0,0];
firingTimer = 0;
firingTimerMax = 15;