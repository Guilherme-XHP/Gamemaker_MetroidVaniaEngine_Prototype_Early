x = lerp(x, obj_player.x, 0.2);
y = lerp(y, obj_player.y - 24, 0.2);

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