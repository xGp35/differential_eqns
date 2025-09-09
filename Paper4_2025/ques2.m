% Q2: Plot cardioid r(theta) = a(1 + cos(theta)), a = 1

clc; clear; close all;

% Parameters
a = 1;
theta = linspace(0, 2*pi, 500);

% Polar equation
r = a * (1 + cos(theta));

% Convert to Cartesian
x = r .* cos(theta);
y = r .* sin(theta);

% Plot
figure;
plot(x, y, 'm', 'LineWidth', 2);

% Labels and formatting
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
title('Cardioid: r(\theta) = 1 + cos(\theta)', 'FontSize', 16);
axis equal;   % Keep aspect ratio equal
grid on;

