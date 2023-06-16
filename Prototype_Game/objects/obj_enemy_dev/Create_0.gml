randomize();

spd = .1;
grav = .01;
h_spd = 0;
v_spd = 0;
v_spd_max = 8;

collisionh = place_meeting(x+h_spd, y, obj_player) or place_meeting(x, y-1, obj_player);
collisiony = place_meeting(x, y + v_spd, obj_player) or place_meeting(x, y - 1, obj_player);

alarm[0] = -1;

enemy_life = 50;

//State Anim
state = "jump";

enemy_life = 5;

hit = false;