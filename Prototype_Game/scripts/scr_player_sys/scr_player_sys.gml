function scr_player_collision(){
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

//Script Do Player

function scr_player_sys() { 
	
	#region Colisao e Controles 

	script_execute(scr_input);
	
	with (obj_joystick){
		var joy_move = joy_x / radius;
	}

	var move = key_right - key_left;
	var _wall_jump = place_meeting(x - 1, y, obj_wall) || place_meeting(x + 1, y, obj_wall);

	//Aceleracao X
	h_spd = h_spd + acc * move;
	with (obj_joystick){
		other.h_spd = other.h_spd + other.acc * joy_move;
	}
	h_spd = clamp(h_spd, -spd, spd)
	
	//Gravidade
	v_spd = v_spd + grav;
	v_spd = clamp(v_spd, -v_spd_max, v_spd_max);
	
	with (obj_joystick){
		if move = 0 and joy_move = 0 
		other.h_spd = lerp(other.h_spd, 0, other.dcc);
	}
	

	
	scr_player_collision();
	
	#endregion
	
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
	}else if state = "run"{
		sprite_index = spr_player_run;
	}else if state = "wjump"{
		sprite_index = spr_player_wjump;
	}else if state = "punch"{
		sprite_index = spr_player_punch;
	}else if state = "dash"{
		sprite_index = spr_player_dash;
	}

	#endregion	
	
	#region Funcoes
	
	#region	Mundança de Sprite  
	
		//Virar Sprite
		if h_spd != 0 {
			image_xscale = sign(h_spd);
		}
	
		//Walk e Idle Controle (So Assim Que Ta Pegando)
		if h_spd = 0 {
			state = "idle";
		}else {
			state = "run";
		}
	
	#endregion

	#region Coyote Time
		if place_meeting(x, y + 1, obj_wall){
			in_ground = true;
			coyote_time = 0;
		}else{
			coyote_time++;
			if coyote_time >= coyote_time_max {
				coyote_time = 0
				in_ground = false;
			}
		}
	#endregion
	
	#region Jump
		if in_ground or perry_isDispo{
			if key_jump {
				//audio_play_sound(choose(snd_jump1, snd_jump2, snd_jump3, snd_jump4), 1, 0);
				v_spd = -8;
				in_ground = false;
				state = "jump";
		
			
				instance_particle_dust = instance_create_depth(x,y,depth,obj_particles);
				instance_particle_dust.set_size(1, 2);
				instance_particle_dust.set_direction(0,180);
				instance_particle_dust.set_emitter_size(-8,8, 0, 0);
				instance_particle_dust.set_speed(5,8,-0.7);
				instance_particle_dust.set_life(30, 90);
				instance_particle_dust.burst(90);
			
			}
		}else{
			in_ground = false;
			state = "jump";
		}
	
	#endregion

	#region Wall Jump
	
		if _wall_jump { 
			
				if v_spd > 0.8 {
			
					instance_particle_dust.set_life(50, 120);
					instance_particle_dust.set_direction(80,100);
					instance_particle_dust.set_size(0.8, 2);
					instance_particle_dust.set_speed(0.5,1,-0.2);
					instance_particle_dust.burst(-5);
					
					v_spd = 0.8;
					state = "wjump"
			
					if key_jump{
						
						//audio_play_sound(choose(snd_jump1, snd_jump2, snd_jump3, snd_jump4), 1, 0);
						h_spd -= 4 * image_xscale;
						v_spd -= 8;
						
				}
			}	
		}
		
	#endregion
	
	#region Punch
		if h_spd > 0.01{
			state_dir = "r";
		}else if h_spd < -0.01{
			state_dir = "l";
		}
	
		if punch_timer <= 0 {
			if key_punch{
				alarm[3] = 1; 
				alarm[3] = 0{
					state = "punch";
					instance_create_layer(x, y - 16, "GAME", obj_atk_hitbox); 
					}
				audio_play_sound(snd_hit, 1,0 );
			
			
				punch_timer = punch_dur;
				scr_player_collision();
			}	
		}else{
			punch_timer--;
			state = "punch";
		}
	#endregion
	
	#region Dash 
	
		if (state = "wjump"){
			in_wall = true	
		}else{
			in_wall = false
		}
	
		if (dash_isDispo and !in_wall){
			if (key_dash && dash_timer <= 0 ){
				dash_timer = dash_durat;
			}
		}
		if(dash_isDispo = false){
			dash_cooldown--
		} 
		if (dash_cooldown = 0){
			dash_isDispo = true
			dash_cooldown = 90
		}
		if (dash_timer > 0){
		
			instance_particle_dust.set_life(50, 120);
			instance_particle_dust.set_direction(80,100);
			instance_particle_dust.set_size(0.8, 2);
			instance_particle_dust.set_speed(0.5,1,-0.2);
			instance_particle_dust.burst(10);
		
			var dash_progress = 1 - (dash_timer / dash_durat);
			var interpolacao_spd = lerp(spd * image_xscale, dash_spd * image_xscale, dash_progress * dash_suave);
			h_spd = interpolacao_spd ;
			dash_timer--;
			state = "dash"
			scr_player_collision();
			dash_isDispo = false
		} 
	
		if (dash_timer <= 0){
			speed = 0;
		}
	
	#endregion
	
	#region Bubbles
	
		if place_meeting(x + 1, y, obj_bubbles){
				
			if (keyboard_check_pressed(vk_down)){
				para_baixo = true
			} else if(key_jump) {
				para_baixo = false
			}	
			
			if (para_baixo){
				v_spd = 4
			}else{
				v_spd = -4;
			}
			
		}else{
			para_baixo = false
		}
		
	#endregion
	
	#endregion
	
	#region Testes
		
		if place_meeting(x, y + 1, obj_ball){
			perry_isDispo = true
		}else{
			perry_isDispo = false
		}
		
	#endregion
}
