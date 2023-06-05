draw_self();
draw_sprite_ext(mask_index,0,x,y,1,1,0,c_white,1);
draw_text(x + 16,y - 48, string(state));
draw_text(x + 16,y - 32, string(h_spd));
draw_text(x + 16,y - 16, string(v_spd));