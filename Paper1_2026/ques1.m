% Q1: Plot a 5th-degree polynomial and its derivatives

clc; clear; close all;

% Define x range
x = linspace(-3, 3, 400);

% Define polynomial and derivatives (these are vectors, not functions)
y  = x.^5 - 4*x.^4 + 3*x.^3 - 2*x.^2 + x - 1;  % Original function values
y1 = 5*x.^4 - 16*x.^3 + 9*x.^2 - 4*x + 1;      % First derivative values
y2 = 20*x.^3 - 48*x.^2 + 18*x - 4;             % Second derivative values

% Plot
figure;
plot(x, y,  'LineWidth', 2); hold on;
plot(x, y1, '--', 'LineWidth', 2);
plot(x, y2, '-.', 'LineWidth', 2);

% Labels and formatting
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
title('Polynomial Function and its Derivatives', 'FontSize', 16);
legend('f(x)', 'f''(x)', 'f''''(x)', 'Location', 'best', 'FontSize', 12);
grid on;

