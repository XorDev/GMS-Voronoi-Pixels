///@desc Update demo animations

//Target angle and scale.
var angle = mouse_x/room_width*2-1;
var scale = 1.1+max(mouse_y/room_height*2-1,0)*.1;

//Smoothly follow mouse (and add slide).
x = lerp(x,mouse_x*(1-scale),.05)-.1*power(slide,3);
y = lerp(y,mouse_y*(1-scale),.05)-.1*power(slide,3);

//Smoothly update scaling and angle.
image_xscale = lerp(image_xscale,scale,.05);
image_yscale = image_xscale;
image_angle = lerp(image_angle,angle,.05)+.1*power(slide,6);

//Check slide controls.
var next,prev;
next = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space);
prev = mouse_check_button_pressed(mb_right);

//Update slide animation.
slide = min(max(slide*.99,-1+2*next),1-2*prev);
if (next || prev) image_index = floor(image_index+sign(slide));
image_index += slide*.005;

//Check scrolling controls.
var val_up,val_down;
val_up   = max(mouse_wheel_up()  , keyboard_check(vk_right)/4, keyboard_check_pressed(vk_up));
val_down = max(mouse_wheel_down(), keyboard_check(vk_left) /4, keyboard_check_pressed(vk_down));

//Update scrolling animation.
wheel = lerp(wheel,val_up-val_down,.1);
scroll = clamp(scroll+wheel*.1,0,1);
amount = lerp(amount,scroll,.4);

//Toggle and animate parameters.
transition_enabled ^= keyboard_check_pressed(ord("1")) || keyboard_check_pressed(ord("T"));
transition = lerp(transition,transition_enabled,.05);

animation_enabled ^= keyboard_check_pressed(ord("2")) || keyboard_check_pressed(ord("P"));
animation = lerp(animation,animation_enabled,.05);
image_speed = (abs(slide)<.01) * animation;

amplified_enabled ^= keyboard_check_pressed(ord("3")) || keyboard_check_pressed(ord("A"));
amplified = lerp(amplified,amplified_enabled,.05);