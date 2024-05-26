polynomial = @(z) z.^3 - 1;
derivative_polynomial = @(z) 3*z.^2;
roots_exact = roots([1, 0, 0, -1]);
x_values = linspace(-2, 2, 500);
y_values = linspace(-2, 2, 500);
[X_grid, Y_grid] = meshgrid(x_values, y_values);
Z_values = X_grid + 1i * Y_grid;

for iteration = 1:20
    Z_values = Z_values - polynomial(Z_values) ./ derivative_polynomial(Z_values);
end

hold on;
colors = ['r', 'g', 'b'];

for root_index = 1:length(roots_exact)
    distances = abs(Z_values - roots_exact(root_index));
    is_near = distances < 0.0000001;
    plot(X_grid(is_near), Y_grid(is_near), '.', 'Color', colors(root_index), 'MarkerSize', 1);
end

% Настройка графического окна
xlabel('Re(z)');
ylabel('Im(z)');
hold off;

