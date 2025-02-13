shader_type canvas_item;

uniform vec4 substrate_color;  // Remove `: hint_color`
uniform float square_size = 1.0;

void fragment() {
    float gradient = 1.0 - UV.y; // Creates a top-to-bottom gradient
    float density = smoothstep(0.3, 0.9, gradient); // Controls dot density

    // Adjust the grid pattern size dynamically
    vec2 grid = fract(UV * vec2(80.0 * square_size, 120.0 * square_size));
    float dotPattern = step(0.04, grid.x) * step(0.04, grid.y); // Creates squares

    // Apply gradient to the squares
    float finalPattern = dotPattern * density;

    // Define dot color (slightly darker than the base color)
    vec4 dotColor = vec4(0.6, 0.5, 0.4, 1.0);

    // Mix the base substrate color with the dot pattern
    COLOR = mix(substrate_color, dotColor, finalPattern);
}