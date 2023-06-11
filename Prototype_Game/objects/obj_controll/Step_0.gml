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

if (keyboard_check_pressed(vk_escape)){
game_end();
} 
