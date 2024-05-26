gravity_multiplier = 4;
gravity_acceleration = 9.81 * gravity_multiplier;
initial_height = 10;
initial_conditions = [initial_height; 0];
simulation_duration = 10;
time_interval = [0, simulation_duration];
tolerance = 1e-6;
trajectory_data = [];
max_steps = 10;
differential_equation = @(t, y) [y(2); -gravity_acceleration]; % y(1) = y, y(2) = y'

function [value, isterminal, direction] = ground_contact_event(t, y)
  value = y(1);
  isterminal = 1;
  direction = -1;
end

for step = 1:max_steps
  options = odeset('Events', @ground_contact_event);
  [time_values, state_values, event_time, event_state, event_index] = ode45(differential_equation, time_interval, initial_conditions, options);
  trajectory_data = [trajectory_data; time_values, state_values];

  if isempty(event_index)
    break;
  else
    impact_velocity = event_state(2);
    initial_conditions = [0; -0.9 * impact_velocity];
    time_interval = [event_time, simulation_duration];
  end

  if abs(diff(time_interval)) < tolerance
    break;
  end
end

trajectory_time = trajectory_data(:, 1);
trajectory_height = trajectory_data(:, 2);
plot(trajectory_time, trajectory_height);

