shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
uniform vec4 color: source_color = vec4(1.0);
void fragment() {
	// Called for every pixel the material is visible on.
	COLOR.rgb = color.rgb;
	float distance_from_center = distance(UV, vec2(0.5,0.5));
	float zero_to_one = smoothstep(0.45,0.46, distance_from_center);
	COLOR.a = 1.0-zero_to_one;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
