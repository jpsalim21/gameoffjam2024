shader_type canvas_item;

uniform float endFade : hint_range(-0.1, 1.1) = 0.5;
uniform float startFade : hint_range(-0.1, 1.1) = 0.0;
uniform float fadeStep : hint_range(0.0, 1.0) = 0.1;
const float divisoes = 1.0 / 4.0;

void fragment() {
	float posX = UV.x;
	
	if(UV.x > endFade){
		if(UV.x < endFade + fadeStep){
			COLOR.a = 1.0 - (abs(endFade - UV.x) / fadeStep);
		} else {
			COLOR.a = 0.0;
		}
	} else if(UV.x < startFade){
		if(UV.x > startFade - fadeStep){
			COLOR.a = 1.0 - (abs(startFade - UV.x) / fadeStep);
		} else {
			COLOR.a = 0.0;
		}
	}
	
	/*
	if(UV.y < divisoes){
		COLOR.a = 0.0;
	} else if(UV.y < 2.0 * divisoes){
		COLOR.a = 1.0; 
	} else if (UV.y < 3.0 * divisoes){
		COLOR.a = 0.0;
	}
	*/
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
