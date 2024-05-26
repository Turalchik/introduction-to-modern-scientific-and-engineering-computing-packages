function hypersurf(A)

  eps = 10^(-6);

  u = linspace(0, pi, 100);
  v = linspace(0, 2 * pi, 100);

  [U, V] = meshgrid(u, v);

  inv_1 = sum(diag(A)) - A(4, 4);
  inv_2 = det(A([1 2], [1 2])) + det(A([2 3], [2 3])) + det(A([1 3], [1 3]));
  inv_3 = det(A(1:3, 1:3));
  inv_4 = det(A);

  eigenvalues = eig(A(1:3, 1:3));
  if (inv_3 != 0 && (inv_2 <= 0 || inv_1 * inv_3 <= 0) && 0 < inv_4)

    u = linspace(0, pi, 100);
    v = linspace(0, 2 * pi, 100);
    [U, V] = meshgrid(u, v);

    a = sqrt(abs(inv_4 / (eigenvalues(1) * inv_3)));
    b = sqrt(abs(inv_4 / (eigenvalues(2) * inv_3)));
    c = sqrt(abs(inv_4 / (eigenvalues(3) * inv_3)));

    X = a * cosh(U) .* cos(V);
    Y = b * cosh(U) .* sin(V);
    Z = c * sinh(U);

    surf(X, Y, Z);
    hold on;
    surf(X, Y, -Z);
    hold off;
  elseif (inv_3 == 0 && 0 < inv_4)
    real_eigenvalues = eigenvalues(eps < abs(eigenvalues));
    a = 2 * sqrt(abs(inv_4 / inv_2)) / abs(real_eigenvalues(1));
    b = 2 * sqrt(abs(inv_4 / inv_2)) / abs(real_eigenvalues(2));

    x = linspace(-50, 50, 100);
    y = linspace(-50, 50, 100);
    [X, Y] = meshgrid(x, y);

    Z = X.^2 / a + Y.^2 / b;
    surf(X, Y, Z);
  endif


endfunction
