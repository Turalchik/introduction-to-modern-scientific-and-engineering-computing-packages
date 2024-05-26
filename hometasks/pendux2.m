function [time, x_end1, y_end1, x_end2, y_end2] = pendux2(link_params, initial_angle1, initial_angle2, time_span)
    mass1 = link_params(1).mass;
    length1 = link_params(1).length;
    mass2 = link_params(2).mass;
    length2 = link_params(2).length;
    gravity = 9.81;

    function dydt = equations(time, state)
        theta1 = state(1);
        theta2 = state(2);
        theta1_dot = state(3);
        theta2_dot = state(4);

        delta = theta2 - theta1;
        denom1 = (mass1 + mass2) * length1 - mass2 * length1 * cos(delta) ^ 2;
        denom2 = (length2 / length1) * denom1;

        theta1_ddot = (mass2 * length1 * theta1_dot ^ 2 * sin(delta) * cos(delta) +
                       mass2 * gravity * sin(theta2) * cos(delta) +
                       mass2 * length2 * theta2_dot ^ 2 * sin(delta) -
                       (mass1 + mass2) * gravity * sin(theta1)) / denom1;

        theta2_ddot = (-mass2 * length2 * theta2_dot ^ 2 * sin(delta) * cos(delta) +
                       (mass1 + mass2) * (gravity * sin(theta1) * cos(delta) -
                       length1 * theta1_dot ^ 2 * sin(delta) -
                       gravity * sin(theta2))) / denom2;

        dydt = [theta1_dot; theta2_dot; theta1_ddot; theta2_ddot];
    endfunction

    initial_state = [initial_angle1; initial_angle2; 0; 0];

    [time, state] = ode45(@equations, time_span, initial_state);

    theta1 = state(:, 1);
    theta2 = state(:, 2);

    x_end1 = length1 * sin(theta1);
    y_end1 = -length1 * cos(theta1);
    x_end2 = x_end1 + length2 * sin(theta2);
    y_end2 = y_end1 - length2 * cos(theta2);
endfunction

