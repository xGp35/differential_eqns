% Clear workspace and figures
clc;
clear;
close all;

% Define data
x = linspace(0, 2*pi, 100);  % x from 0 to 2π
y = sin(x);                  % y = sin(x)

% Plot the data
figure;
plot(x, y, 'b-', 'LineWidth', 2);  % blue line with thickness 2

% Add axis labels
xlabel('x-axis (radians)', 'FontSize', 12);
ylabel('y-axis (sin(x))', 'FontSize', 12);

% Add a title
title('Sine Wave', 'FontSize', 16);

% Set axis limits
xlim([0, 2*pi]);             % x-axis from 0 to 2π
ylim([-1.5, 1.5]);           % y-axis from -1.5 to 1.5

% Add a grid
grid on;

% Optional: Add legend
legend('sin(x)', 'Location', 'best');

