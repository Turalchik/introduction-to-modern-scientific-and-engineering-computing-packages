function caterpillar(x,y,n)

x_values = x;
y_values = y;

figure;
plot(x_values, y_values);
hold on;
axis('equal');

radius = 0.5;
circ_points = 100;
angles = linspace(0, 2*pi, circ_points);
circle_x_vals = @(phi) radius * cos(phi);
circle_y_vals = @(phi) radius * sin(phi);

circle_handles = zeros(1, 5);

for i = 1:length(circle_handles)
    x_centre = x_values(end / 4) + (i-1) * 1.5 * radius;
    y_centre = y_values(end / 4) + (i-1) * 1.5 * radius;
    circle_handles(i) = plot(circle_x_vals(angles) + x_centre, circle_y_vals(angles) + y_centre);
endfor

bounces = 0;
max_bounces = 3;
index_direction = 1;
idx = 1;

while bounces < max_bounces
    for i = 1:length(circle_handles)
        centre_idx = idx + (i-1) * 10;
        if centre_idx > length(x_values)
            centre_idx = length(x_values);
        elseif centre_idx < 1
            centre_idx = 1;
        end
        set(circle_handles(i), 'XData', circle_x_vals(angles) + x_values(centre_idx), 'YData', circle_y_vals(angles) + y_values(centre_idx));
    endfor

    idx += index_direction;
    if idx >= length(x_values) || idx <= 1
        index_direction = -index_direction;
        bounces += 1;
    end

    drawnow;
endwhile

hold off;

