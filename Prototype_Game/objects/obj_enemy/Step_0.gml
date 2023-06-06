script_execute(scr_enemy_sys);
if enemy_life <= 0 {
	instance_destroy();
}