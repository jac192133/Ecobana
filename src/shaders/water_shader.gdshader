shader_type canvas_item;

// Explicitly declare the water texture
uniform sampler2D water_texture;
uniform float transparency; // Transparency control

void fragment() {
    vec2 uv = UV;

    // Sample the texture correctly
    vec4 tex_color = texture(water_texture, uv);

    // Ensure transparency is applied without making it fully invisible
    tex_color.a *= max(transparency, 0.2); // Prevent full invisibility

    // Output the final color
    COLOR = tex_color;
}