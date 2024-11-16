shader_type canvas_item;

uniform float transicao : hint_range(-0.1, 1.1) = 0.5;
uniform float fade = 0.1;

const float qtsDivisoes = 6.0; 
const float divisao = 1.0 / qtsDivisoes;

void fragment() {
	for(float i = 1.0; i <= qtsDivisoes; i+=2.0){
		if(UV.y < divisao * i){
			if(UV.x > transicao - fade){
				if(UV.x > transicao){
					COLOR.a = 1.0;
				} else {
					COLOR.a = 1.0 - abs((transicao - UV.x) / fade);
				}
			} else {
				COLOR.a = 0.0;
			}
			break;
		} else if (UV.y < divisao * (i+1.0)){
			if(UV.x > 1.0 - transicao){
				if(UV.x > 1.0 - transicao - fade){
					COLOR.a = 1.0 - abs((1.0 - transicao - UV.x) / fade);
				} else {
					COLOR.a = 0.0;
				}
			} else {
				COLOR.a = 1.0;
			}
			break;
		}
	}
	
	/*
	if(UV.y < divisao){
		if(UV.x > transicao){
			COLOR.a = 0.0;
		} else {
			COLOR.a = 1.0;
		}
	} else if (UV.y < 2.0 * divisao){
		if(UV.x < 1.0 - transicao){
			COLOR.a = 0.0;
		} else {
			COLOR.a = 1.0;
		}
	} else if (UV.y < 3.0 * divisao){
		if(UV.x > transicao){
			COLOR.a = 0.0;
		} else {
			COLOR.a = 1.0;
		}
	} else {
		if(UV.x < 1.0 - transicao){
			COLOR.a = 0.0;
		} else {
			COLOR.a = 1.0;
		}
	}
	*/
}
