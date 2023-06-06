spd = 1.5;
grav = .5;
h_spd = 0;
v_spd = 0;
v_spd_max = 8;
dir = 1;

collisionh = place_meeting(x+h_spd, y, obj_player) or place_meeting(x, y-1, obj_player);
collisiony = place_meeting(x, y + v_spd, obj_player) or place_meeting(x, y - 1, obj_player);

state = "idle";

alarm[0] = 1;

enemy_life = 50;
