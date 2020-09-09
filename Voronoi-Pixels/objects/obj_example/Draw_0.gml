///@desc Draw voronoi effect

var index,edge,time;
//Animation math up for demo:
index = floor(image_index);
edge = (image_index-index)*2-1;
time = index+.5*power(edge,5)*transition;
time *= 1+2*amplified;

//Fade during transition.
image_alpha = 1-power(edge,32);

//Get sprite texture.
var tex_id = sprite_get_texture(sprite_index,image_index);
//Draw self with voronoi effect.
voronoi_set(tex_id,amount,time);
draw_self();
voronoi_reset();