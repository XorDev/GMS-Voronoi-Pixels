///@desc Draw UI text

gpu_set_tex_filter(true);
gpu_set_blendmode(bm_add);
draw_set_color($888888);

//Draw offset percentage and bar:
var fade = clamp(power(abs(wheel),.1)/.2-.2,0,1);
draw_set_font(fnt_main);
draw_set_alpha(fade);
draw_text(24-x,24-y,"Offset "+string(round(amount*100))+"%");

draw_set_alpha(power(fade,4)*.5);
draw_roundrect(256-x,38-y,380-x,46-y,0);
draw_set_alpha(sqr(fade));
draw_roundrect(256+amount*100-x,26-y,280+amount*100-x,58-y,0);
draw_set_alpha(1);


//Draw applied parameters.
draw_set_font(fnt_small);
draw_set_alpha(.6-.6*transition);
draw_text(24-x*.8,64-y*.8,"Transitions disabled");
draw_set_alpha(.6-.6*animation);
draw_text(24-x*.8,88-y*.8,"Animation paused");
draw_set_alpha(.6*amplified);
draw_text(24-x*.8,116-y*.8,"Amplified transition mode");

gpu_set_blendmode(bm_normal);
gpu_set_tex_filter(false);