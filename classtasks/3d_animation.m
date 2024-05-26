clear;
x_values = 0:pi/100:4*pi;
y_values = x_values;
[X_grid, Y_grid] = meshgrid(x_values, y_values);
z_values = 3*sin(X_grid) + cos(Y_grid);
surface_handle = surf(z_values);
axis tight;
shading interp;
colormap(spring);

for angle = 0:pi/100:2*pi
  z_values = (sin(X_grid) + cos(Y_grid)) .* sin(angle);
  set(surface_handle, 'Zdata', z_values);
  drawnow
endfor

