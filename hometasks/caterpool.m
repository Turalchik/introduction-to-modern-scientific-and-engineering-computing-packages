function caterpool(initial_position, initial_velocity, lower_left, upper_right, iterations)
  % Извлекаем начальные координаты и скорость
  x0 = initial_position(1);
  y0 = initial_position(2);
  vx = initial_velocity(1);
  vy = initial_velocity(2);

  x_min = lower_left(1);
  y_min = lower_left(2);
  x_max = upper_right(1);
  y_max = upper_right(2);

  x = zeros(1, iterations);
  y = zeros(1, iterations);

  x(1) = x0;
  y(1) = y0;

  for i = 2:iterations
    x(i) = x(i-1) + vx;
    y(i) = y(i-1) + vy;

    if x(i) <= x_min || x(i) >= x_max
      vx = -vx;
    endif

    if y(i) <= y_min || y(i) >= y_max
      vy = -vy;
    endif

    x(i) = max(x_min, min(x(i), x_max));
    y(i) = max(y_min, min(y(i), y_max));
  endfor

  caterpillar(x, y, 10); % Например, 10 окружностей в гусенице
endfunction

