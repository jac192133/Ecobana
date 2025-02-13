shader_type canvas_item;

// Light properties
uniform vec2 light_position = vec2(600.0, 200.0); // Light source position
uniform vec3 light_color = vec3(1.0, 0.9, 0.7);   // Warm light color
uniform float light_intensity = 1.0;              // Light strength
uniform float light_falloff = 0.0025;             // Light fade effect
uniform vec2 surface_normal;                      // Surface direction

void fragment() {
    vec2 uv_pos = SCREEN_UV * vec2(1280.0, 720.0); // Scale UV to match room size
    vec2 light_dir = normalize(light_position - uv_pos);

    float angle_factor = dot(light_dir, surface_normal); // Light interaction
    float dist = length(uv_pos - light_position);
    float shading = clamp(1.0 - (dist * light_falloff), 0.0, 1.0) * angle_factor;

    vec3 color = mix(vec3(0.1, 0.1, 0.1), light_color, shading * light_intensity);

    COLOR = vec4(color, 1.0);
}