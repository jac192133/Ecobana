shader_type canvas_item;

void fragment() {
    float gradient = 1.0 - UV.y; // Creates a top-to-bottom gradient
    float density = smoothstep(0.3, 0.9, gradient); // Controls dot density

    // Create dot pattern
    vec2 grid = fract(UV * vec2(80.0, 120.0)); // Adjust density scale (X, Y)
    float dotPattern = step(0.04, grid.x) * step(0.04, grid.y); // Creates dots

    // Apply gradient to dots
    float finalPattern = dotPattern * density;

    // Define colors
    vec4 baseColor = vec4(0.862745, 0.772549, 0.65098, 1); // Substrate color
    vec4 dotColor = vec4(0.75, 0.65, 0.55, 1.0); // Slightly darker for dots

    COLOR = mix(baseColor, dotColor, finalPattern);
}