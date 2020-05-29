/// @description Shoot gravity gun
ds_list_add(bulletList, instance_create_layer(x, y, "Instances", obj_gGunBullet));
var bullet = bulletList[|(ds_list_size(bulletList) - 1)];
bullet.rot = -pointerDir;
bullet.xVel = lengthdir_x(bullet.spd, bullet.rot);
bullet.yVel = lengthdir_y(bullet.spd, bullet.rot);
bullet.attractive = attractiveBullets;
bulletCooldown = 15;