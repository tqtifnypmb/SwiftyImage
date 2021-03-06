#version 300 es

precision mediump float;

in vec2 fTextCoor;

uniform sampler2D firstInput;
uniform sampler2D secondInput;

out vec4 color;

vec4 divide(vec4 a, vec4 b) {
    float br = b.r;
    float bg = b.g;
    float bb = b.b;
    float ba = b.a;
    
    if (br == 0.0 ||
        bg == 0.0 ||
        bb == 0.0 ||
        ba == 0.0) {
        return a;
    } else {
        return vec4(a.r / br, a.g / bg, a.b / bb, a.a / ba);
    }
}

void main() {
    vec4 top = texture(secondInput, fTextCoor);
    vec4 bottom = texture(firstInput, fTextCoor);
    
    color = divide(top, bottom);
}

