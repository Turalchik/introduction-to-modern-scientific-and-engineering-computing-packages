x_values = linspace(0, 1, 1000);
y_values = humps(x_values);
plot(x_values, y_values);
hold on;

[y_max_value, index_max] = max(y_values);
x_max_value = x_values(index_max);

plot(x_max_value, y_max_value, 'r.', 'MarkerSize', 20);
index_interval = y_values >= 20 & y_values <= 40;
x_interval_values = x_values(index_interval);
y_interval_values = y_values(index_interval);
plot(x_interval_values, y_interval_values, 'p')

