shader_type canvas_item;

uniform float endFade : hint_range(0.0, 1.0) = 0.5;
uniform float startFade : hint_range(0.0, 1.0) = 0.0;

void fragment() {
	float posX = UV.x;
	if(posX > endFade){
		COLOR.a = 0.0;
	}
	if(posX < startFade){
		COLOR.a = 0.0;
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
