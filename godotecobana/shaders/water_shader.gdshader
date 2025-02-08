shader_type canvas_item;  // Ensure it's a 2D shader

// Declare uniform variables correctly
uniform vec4 water_color; // Removed : hint_color to avoid errors
uniform float wave_speed;  // Controls wave movement speed
uniform float wave_amplitude;  // Height of waves
uniform float wave_frequency;  // Number of waves
uniform float transparency;  // Water transparency

void fragment() {
    vec2 uv = UV;

    // Create a wave distortion effect using sine function
    uv.y += sin(TIME * wave_speed + uv.x * wave_frequency) * (wave_amplitude / 100.0);

    // Sample the texture at the modified UV coordinates
    vec4 tex_color = texture(TEXTURE, uv);

    // Apply water color blending and transparency
    vec4 final_color = mix(tex_color, water_color, 0.4);
    final_color.a *= transparency;

    COLOR = final_color;
}
