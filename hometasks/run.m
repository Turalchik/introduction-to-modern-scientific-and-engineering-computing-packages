function run()

    link_params = struct('mass', {1.0, 1.0}, 'length', {1.0, 1.0});

    initial_angle1 = pi / 2;
    initial_angle2 = pi / 2;

    time_span = linspace(0, 10, 5000);

    [time, x_end1, y_end1, x_end2, y_end2] = pendux2(link_params, initial_angle1, initial_angle2, time_span);

    hold on;
    axis equal;
    xlim([-3 3]);
    ylim([-3 3]);
    grid on;

    plot(x_end1, y_end1, 'r--');
    plot(x_end2, y_end2, 'b--');

    line1 = line([0 x_end1(1)], [0 y_end1(1)], 'marker', 'o', 'color', 'b');
    line2 = line([x_end1(1) x_end2(1)], [y_end1(1) y_end2(1)], 'marker', 'o', 'color', 'r');

    for i = 1:length(time)
        set(line1, 'XData', [0 x_end1(i)], 'YData', [0 y_end1(i)]);
        set(line2, 'XData', [x_end1(i) x_end2(i)], 'YData', [y_end1(i) y_end2(i)]);
        drawnow;
    end
endfunction

run();

