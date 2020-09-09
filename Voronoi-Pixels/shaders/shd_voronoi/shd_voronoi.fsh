/*
	Voronoi-pixel shader by @XorDev
	
	This shader samples textures pixels with randomized offsets to break the standard "pixely" look.
	You can try uncommenting the other distance expressions in the 'dist' function for different looks.
*/
varying vec4 v_color;
varying vec2 v_coord;

//(Left, top) texture coordinate, texel size (width, height).
uniform vec4 texel;
//Offset amount (should be between 0 and 1).
uniform float amount;
//Animation time (use 0 for no animation or randomize it).
uniform float time;

//Offset direction vector:
vec2 offset(vec2 p)
{
	//Compute a pseudo-random (hash), animate with time and multiply amplitude.
	return cos(cos(p*mat2(58,-96,-84,62))*492.+time)*.5*amount;	
}
//Voronoi distance function:
float dist(vec2 d)
{
	float l;
	//Euclidean distance.
	l = dot(d,d);
	
	//Manhattan distance.
	//l = abs(d.x)+abs(d.y);
	
	//Squares.
	//l = step(.5,max(abs(d.x),abs(d.y)));
	
	//Circles.
	//l = max(dot(d,d),.5);
	return l;	
}
//Compute coordinates of nearest voronoi cell:
vec2 voronoi(vec2 p)
{
	
	vec2 f = floor(p);
	//Max distance.
	float m = 5.;
	//Output pixel coordinates.
	vec2 o = f;
	
	//Loop through neighboring cells:
	for(float cx = -1.;cx<=1.;cx++) 
	for(float cy = -1.;cy<=1.;cy++)
	{
		//Cell position.
		vec2 c = f+vec2(cx,cy);
		//Compute the distance to cell offset.
		float d = dist(offset(c)+c-p);
		
		//Check if this cell is closer:
		if (d<m)
		{
			//Use this cell's coordinates.
			o = c;
			m = d;
		}
	}
	return o;
}

void main()
{
	//Compute pixel coordinates (whole numbers for pixels).
	vec2 pixel = (v_coord-texel.xy)/texel.zw;
	//Add voronoi offsets.
	pixel = voronoi(pixel);
	//Convert back to texture coordinates.
	vec2 coord = pixel*texel.zw+texel.xy;
	
    gl_FragColor = v_color * texture2D(gm_BaseTexture, coord);
}