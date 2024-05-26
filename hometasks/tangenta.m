function tangenta(fd,dmin,dmax,n)
% Функция для построения графика касательной для параметрически заданной плоской кривой
  t = linspace(dmin, dmax, 2 * n + 1);
  eps = 10^(-8);

  points = zeros(2, length(t));
  for k = 1:length(t)
    points(:, k) = fd(t(k));
  endfor
  plot(points(1, :), points(2, :), 'b');

  tmid = t(n + 1);
  h = 10^(-8);
  df = (fd(tmid + h) - fd(tmid)) / h;

  hold on;
  if eps < abs(df(1))
    y = (df(2) / df(1)) * (points(1, :) - points(1, n + 1)) + points(2, n + 1);
    plot(points(1, :), y, 'r');
  else
    x = (df(1) / df(2)) * (points(2, :) - points(2, n + 1)) + points(1, n + 1);
    plot(x, points(1, :), 'r');
  endif
  hold off;
endfunction
