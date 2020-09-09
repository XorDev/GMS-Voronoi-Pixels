///@desc Initialize

//Slide in.
x -= 2;
y -= 8;

//Slide animation variable.
slide = 0;

//Scroll animation variables.
wheel = 0;
scroll = 1;
amount = 0;

//Parameter variables:
animation_enabled = 1;
animation = animation_enabled;

transition_enabled = 1;
transition = transition_enabled;

amplified_enabled = 0;
amplified = amplified_enabled;

//Initialize voronoi.
voronoi_init();

//Set AA.
var max_aa = max(display_aa&8, display_aa&4, display_aa&2);
display_reset(max_aa,0);