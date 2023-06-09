var _room = instance_position(global.cam_alvo.x, global.cam_alvo.y, obj_room);

global.cam_x = lerp(global.cam_x, global.cam_alvo.x - global.cam_w /2, .1);
global.cam_y = lerp(global.cam_y, global.cam_alvo.y - global.cam_h /2, .1);

if _room {
	global.cam_x_min = _room.x;
	global.cam_x_max = _room.x + (global.cam_w * _room.image_xscale) - global.cam_w;
	
	global.cam_y_min = _room.y;
	global.cam_y_max = _room.y + (global.cam_h * _room.image_yscale) - global.cam_h;
}else{
	global.cam_x_min = 0;
	global.cam_x_max = room_width - global.cam_x;
	
	global.cam_y_min = 0;
	global.cam_y_max = room_height - global.cam_y;
}

global.cam_x = clamp(global.cam_x, cam_x_min_lerp, cam_x_max_lerp);
global.cam_y = clamp(global.cam_y, cam_y_min_lerp, cam_y_max_lerp);

cam_x_min_lerp = lerp(cam_x_min_lerp, global.cam_x_min, .1);
cam_x_max_lerp = lerp(cam_x_max_lerp, global.cam_x_max, .1);

cam_y_min_lerp = lerp(cam_y_min_lerp, global.cam_y_min, .1);
cam_y_max_lerp = lerp(cam_y_max_lerp, global.cam_y_max, .1);

camera_set_view_pos(view_camera[0], global.cam_x, global.cam_y);

if obj_player.state = "run" {
	snd_walk_timer--;
	}else{
	snd_walk_timer = 1;
	}
if snd_walk_timer = 0{
	snd_walk_timer = 25;
} 
if snd_walk_timer = 25{
	audio_play_sound(choose(tile1, tile2, tile3, tile4), 1, 0);
} 