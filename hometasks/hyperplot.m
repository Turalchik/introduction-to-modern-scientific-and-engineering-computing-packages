function hyperplot(A)


  inv_1 = sum(diag(A)) - A(4, 4);
  inv_2 = det(A([1 2], [1 2])) + det(A([2 3], [2 3])) + det(A([1 3], [1 3]));
  inv_3 = det(A(1:3, 1:3));
  inv_4 = det(A);

  eigenvalues = eig(A(1:3, 1:3));
  if (inv_3 != 0 && (inv_2 <= 0 || inv_1 * inv_3 <= 0) && 0 < inv_4)

    a = sqrt(abs(inv_4 / (eigenvalues(1) * inv_3)));
    b = sqrt(abs(inv_4 / (eigenvalues(2) * inv_3)));
    c = sqrt(abs(inv_4 / (eigenvalues(3) * inv_3)));

    A = [1/a 0 1/c; 1/a 0 -1/c];

    for k = 1:5:1000
      A(1, 2) = -k / b;
      A(2, 2) = 1 / (k * b);

      x_p = det(A(:, [2 3]));
      y_p = det(A(:, [3 1]));
      z_p = det(A(:, [1 2]));

      d = [k; 1 / k];

      x = A(:, [1 3]) \ d;
      t = linspace(-10, 10, 100);

      X = x(1) + x_p * t;
      Y = y_p * t;
      Z = x(2) + z_p * t;

      plot3(X, Y, Z, 'r', 'LineWidth', 2);
      hold on;

    endfor
  endif
end

