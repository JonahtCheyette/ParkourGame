/// @description Update Camera

// update destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//update object position
x += (xTo - x) / 12;
y += (yTo - y) / 12;

x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);


//update camera position
camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);