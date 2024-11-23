shader_type canvas_item;

uniform float wave_amplitude : hint_range(0.0, 20.0) = 0.3;
uniform float wave_frequency : hint_range(0.0, 10.0) = 0.1;
uniform float wave_speed : hint_range(0.0, 5.0) = 2.0;

void fragment() {
    vec2 pos = FRAGCOORD.xy;
    float wave = sin(pos.x * wave_frequency + TIME * wave_speed) * wave_amplitude;
    COLOR = texture(TEXTURE, UV + vec2(0.0, wave / 100.0)); // Adjust divisor to scale the wave
}
