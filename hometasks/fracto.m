function fracto(p, ll, ur, xx, yy)
  % p - вектор коэффициентов полинома
  % ll, ur - координаты верхнего левого и нижнего правого углов прямоугольной области
  % xx, yy - количество точек разбиения для осей Ox и Oy

  dp = polyder(p);
  exact_roots = roots(p);
  iterations = 41;

  x_range = linspace(ll(1), ur(1), xx);
  y_range = linspace(ur(2), ll(2), yy);
  [X, Y] = meshgrid(x_range, y_range);
  Z = X + i*Y;

  for iter = 1:iterations
    Z = Z - polyval(p, Z) ./ polyval(dp, Z);
  end

  colors = 255 * rand(1, length(p) - 1)
  M = zeros(yy, xx);

  for k = 1:length(exact_roots)
    distances = abs(Z - exact_roots(k));
    is_close = distances < 0.001;
    M(is_close) = colors(k);
  end

  image(M);
endfunction
