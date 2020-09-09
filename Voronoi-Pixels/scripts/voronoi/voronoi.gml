function voronoi_init()
{
	//Initialize shader uniforms.
	global.uni_texel = shader_get_uniform(shd_voronoi,"texel");
	global.uni_amount = shader_get_uniform(shd_voronoi,"amount");
	global.uni_time = shader_get_uniform(shd_voronoi,"time");
}
function voronoi_set(texture_id, offset, time)
{
	//Get texture parameters.
	var tex_uvs,tex_w,tex_h;
	tex_uvs = texture_get_uvs(texture_id);
	tex_w = texture_get_texel_width(texture_id);
	tex_h = texture_get_texel_height(texture_id);
	
	//Set the voronoi shader.
	shader_set(shd_voronoi);
	shader_set_uniform_f(global.uni_texel,  tex_uvs[0], tex_uvs[1], tex_w, tex_h);
	shader_set_uniform_f(global.uni_amount, offset);
	shader_set_uniform_f(global.uni_time,   time);
}
function voronoi_reset()
{
	//Reset the shader.
	shader_reset();
}