shader_type canvas_item;

void fragment() {
    vec2 uv = UV;
    float gradient = uv.x; // Left to right gradient
    vec4 color_start = vec4(1.0, 0.854, 0.725, 1.0); // Light peach
    vec4 color_end = vec4(0.9, 0.7, 0.6, 1.0); // Slightly darker peach
    COLOR = mix(color_start, color_end, gradient);
}
