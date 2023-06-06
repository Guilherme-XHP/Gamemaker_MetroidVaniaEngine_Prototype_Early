function scr_enemy_collision(){
	//X
	if place_meeting(x + h_spd, y, obj_wall){
		while !place_meeting(x + sign(h_spd), y, obj_wall){
			x += sign(h_spd);
		}
		h_spd = 0;
	}
	x += h_spd;

	//Y
	if place_meeting(x, y + v_spd, obj_wall){
		while !place_meeting(x, y + sign(v_spd), obj_wall){
			y += sign(v_spd);
		}
		v_spd = 0;
	}
	y += v_spd;
}
	
function scr_enemy_sys(){
	
	v_spd = v_spd + grav;
	v_spd = clamp(v_spd, -v_spd_max, v_spd_max);
	
	h_spd = spd * dir;
	
	scr_enemy_collision();
	
	#region States
	
	if state = "jump"{
		if v_spd < 0 {
			sprite_index = spr_player_jump;
			image_index = 0;
		}else if  v_spd = 0{
			sprite_index = spr_player_jump;
			image_index = 1;
		}else if  v_spd > 0.1{
			sprite_index = spr_player_jump;
			image_index = 2;
		}
	}else if state = "idle" {
		sprite_index = spr_player_idle;
	}else if state = "walk"{
		sprite_index = spr_player_walk;
	}else if state = "wjump"{
		sprite_index = spr_player_wjump;
	}else if state = "punch"{
		sprite_index = spr_player_punch;
	}
	
	#endregion
	
	#region Funcoes
	//Virar Sprite
	if h_spd != 0 {
		image_xscale = sign(h_spd);
	}
	//Fake Colision
	if place_meeting(x + h_spd, y, obj_wall_fake){
		dir = dir * -1;
	}
	
	//Walk e Idle Controle (So Assim Que Ta Pegando)
	if h_spd = 0 {
		state = "idle";
	}else if h_spd > 0 or h_spd < 0 {
		state = "walk";
	}
	
	#endregion
	
}
	