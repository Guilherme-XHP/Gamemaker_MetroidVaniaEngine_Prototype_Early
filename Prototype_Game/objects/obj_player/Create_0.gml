/// @description Variaveis

//Player Vars
spd = 4;
grav = .4;
acc = .4;
dcc = 1;
h_spd = 0;
v_spd = 0;
v_spd_max = 8;

in_ground = false;
coyote_time = 0;
coyote_time_max = 10;
state = "idle";

dash_spd = 90;
dash_dur = 10;
dash_timer = 0;

//Particle
instance_particle_dust = instance_create_depth(x,y,depth,obj_particles);
instance_particle_dust.set_depth(depth + 1);
instance_particle_dust.set_sprite(spr_dust,true, true, false);
instance_particle_dust.set_color_mix(c_white, c_ltgray);
instance_particle_dust.set_alpha(0, 0.7, 0);
instance_particle_dust.set_size(0.5, 1);
instance_particle_dust.set_direction(80,100);
instance_particle_dust.set_orientation(0,300,1);
instance_particle_dust.set_life(30, 90);
instance_particle_dust.set_speed(1,3,-0.5);