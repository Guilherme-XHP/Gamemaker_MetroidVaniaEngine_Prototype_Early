function scr_enemy_sys(){
	
	v_spd = v_spd + grav;
	v_spd = clamp(v_spd, -v_spd_max, v_spd_max);

	//Virar Sprite
	if h_spd != 0 {
		image_xscale = sign(h_spd);
	}
	
	scr_collision();
	
	#region States Animation
	
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
	}else if state = "aggro"{
		sprite_index = spr_player_run;
	}else if state = "walk"{
		sprite_index = spr_player_walk;
	}else if state = "punch"{
		sprite_index = spr_player_punch;
	}else if state = "dash"{
		sprite_index = spr_player_dash;
	}else if state = "hit"{
		sprite_index = spr_player_hit;
	}

	#endregion	
	
	//Walk e Idle Controle (So Assim Que Ta Pegando)
	if h_spd = 0 {
		state = "idle";
	}else {
		state = "walk";
	}
	
} 