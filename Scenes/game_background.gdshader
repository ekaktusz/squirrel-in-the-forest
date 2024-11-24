shader_type canvas_item;

uniform vec4 base_color = vec4(0.0, 0.0, 0.5, 1.0); // Fixed blueish color
uniform vec2 mouse_position; // Normalized mouse position (0.0 to 1.0)
uniform float pixel_size : hint_range(1.0, 50.0) = 10.0; // Pixelation level
uniform float circle_radius : hint_range(0.1, 1.0) = 0.4; // Base radius of the circles
uniform float light_radius : hint_range(0.1, 1.0) = 0.3; // Radius of the light effect
uniform float min_circle_size : hint_range(0.0, 1.0) = 0.1; // Minimum size of the circles
uniform vec2 aspect_ratio = vec2(1.0, 1.0); // Aspect ratio of the ColorRect

void fragment() {
    // Correct the UV coordinates for aspect ratio
    vec2 corrected_uv = vec2(UV.x * aspect_ratio.x, UV.y * aspect_ratio.y);

    // Pixelation: snap UV coordinates to a grid
    vec2 pixel_uv = floor(corrected_uv * pixel_size) / pixel_size;

    // Calculate distance from the mouse to the current pixel
    float distance = length(mouse_position - pixel_uv);

    // Calculate circle size based on distance
    float circle_size = circle_radius * (1.0 - distance / light_radius);
    circle_size = clamp(circle_size, min_circle_size, circle_radius);

    // Calculate the position within the pixel grid
    vec2 grid_pos = fract(corrected_uv * pixel_size) - 0.5;

    // Correct the grid position for aspect ratio
    grid_pos.x /= aspect_ratio.x;
    grid_pos.y /= aspect_ratio.y;

    // Determine if the fragment is within the circle
    float dist_to_center = length(grid_pos);
    float inside_circle = step(dist_to_center, circle_size);

    // Apply brightness based on distance and circle size
    float brightness = clamp(1.0 - distance / light_radius, 0.0, 1.0);
    COLOR = base_color * vec4(brightness * inside_circle, brightness * inside_circle, brightness * inside_circle, 1.0);
}
