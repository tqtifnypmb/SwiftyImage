#version 300 es

precision mediump float;

in vec2 fTextCoor;

uniform sampler2D firstInput;
uniform highp float xOffset;
uniform highp float yOffset;

out vec4 color;

void main() {
    mat3 kernel = mat3(vec3(1.0,  1.0, 1.0),
                       vec3(1.0, -8.0, 1.0),
                       vec3(1.0,  1.0, 1.0));
    vec4 center = texture(firstInput, fTextCoor);
    float acc = 0.0;
    int radius = 1;
    for (int row = -radius; row <= radius; row += 1) {
        for (int col = -radius; col <= radius; col += 1) {
            vec4 tmp = texture(firstInput, fTextCoor + vec2(float(row) * xOffset, float(col) * yOffset));
            
            float intensity = 0.2126 * tmp.r + 0.7152 * tmp.g + 0.0722 * tmp.b;
            acc += intensity * kernel[col + radius][row + radius];
        }
    }
    
    vec3 rgb = clamp(vec3(acc / 8.0), vec3(0.0), vec3(1.0));        //edge detection needed !
    color = vec4(rgb, center.a);
}
