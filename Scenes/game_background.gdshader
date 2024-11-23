shader_type canvas_item;

uniform vec4 base_color  = vec4(0.0, 0.0, 0.5, 1.0); // Fixed dark blue color
uniform float wave_amplitude_base : hint_range(0.0, 50.0) = 30.0;
uniform float wave_frequency_base : hint_range(0.0, 10.0) = 2.0;
uniform float wave_speed_base : hint_range(0.0, 5.0) = 0.5;

uniform vec2 mouse_position; // Normalized mouse position
uniform float pixel_size : hint_range(1.0, 50.0) = 0.2; // Size of each "pixel"

void fragment() {
    // Pixelation: snap UV coordinates to a grid
    vec2 pixel_uv = floor(UV * pixel_size) / pixel_size;

    // Adjust wave parameters based on mouse position
    float wave_amplitude = wave_amplitude_base * (1.0 + mouse_position.x);
    float wave_frequency = wave_frequency_base * (1.0 + mouse_position.y);
    float wave_speed = wave_speed_base * (1.0 + mouse_position.x * mouse_position.y);

    // Calculate wave effect using pixelated UVs
    float wave = sin(pixel_uv.x * wave_frequency + TIME * wave_speed) * wave_amplitude;
    float intensity = pixel_uv.y + wave / 100.0;

    // Apply intensity to fixed base color
    COLOR = base_color * vec4(intensity, intensity, intensity, 1.0);
}
