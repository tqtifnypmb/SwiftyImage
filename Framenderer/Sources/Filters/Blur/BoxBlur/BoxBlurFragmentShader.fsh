#version 300 es

precision mediump float;

in vec2 fTextCoor;

uniform sampler2D firstInput;
uniform float radius;
uniform highp float xOffset;
uniform highp float yOffset;

out vec4 color;

#define M_PI 3.1415926535897932384626433832795

void main() {
    vec4 acc = vec4(0.0);
    
    float weight = 1.0 / (radius * 2.0 + 1.0);
    
    for (float row = 0.0; row <= 2.0 * radius; row += 1.0) {
        vec4 tmp = texture(firstInput, fTextCoor + vec2((row - radius) * xOffset, (row - radius) * yOffset));
        acc += tmp * weight;
    }
    
    color = clamp(acc, vec4(0.0), vec4(1.0));
}
