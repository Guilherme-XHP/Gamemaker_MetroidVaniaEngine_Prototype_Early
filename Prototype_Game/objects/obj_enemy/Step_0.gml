script_execute(scr_enemy_sys);
if enemy_life <= 0 {
	instance_destroy();
}

collisionh = place_meeting(x+h_spd, y, obj_player) or place_meeting(x, y - 1, obj_player);
collisiony = place_meeting(x, y + v_spd, obj_player) or place_meeting(x, y - 1, obj_player);

if bbox_left <= obj_player.bbox_left or bbox_right >= obj_player.bbox_right{
		if collisionh{
			with(obj_player){
				if !place_meeting(x+other.h_spd, y, obj_wall){
					game_restart();
			}
		}
	}
}