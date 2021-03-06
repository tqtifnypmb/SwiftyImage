#version 300 es

precision mediump float;

in vec2 fTextCoor;

uniform sampler2D firstInput;
uniform highp float xOffset;
uniform highp float yOffset;
uniform mat3 xKernel;
uniform mat3 yKernel;

out vec4 color;

void main() {
    float gx = 0.0;
    float gy = 0.0;
    int radius = 1;
    
    for (int row = -radius; row <= radius; row += 1) {
        for (int col = -radius; col <= radius; col += 1) {
            vec2 offset = vec2(float(row) * xOffset, float(col) * yOffset);
            vec4 tmp = texture(firstInput, fTextCoor + offset);
            
            float intensity = 0.2126 * tmp.r + 0.7152 * tmp.g + 0.0722 * tmp.b;
            
            gx += intensity * xKernel[col + radius][row + radius];
            gy += intensity * yKernel[col + radius][row + radius];
        }
    }
    
    float brightness = length(vec2(gx, gy) / 32.0);
    vec3 rgb = clamp(vec3(brightness), vec3(0.0), vec3(1.0));
    
    float angle;
    if (gy == 0.0 && gx == 0.0) {
        angle = 0.0;
    } else {
        angle = atan(gy, gx);
    }
    
    color = vec4(rgb, angle);
}
