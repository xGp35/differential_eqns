% Q1: Plot a 4th-degree polynomial and its derivatives

clc; clear; close all;

% Define function and derivatives
f = @(x) x.^4 - 3*x.^3 + 2*x.^2 - x + 5;      % Original function
f1 = @(x) 4*x.^3 - 9*x.^2 + 4*x - 1;          % First derivative
f2 = @(x) 12*x.^2 - 18*x + 4;                 % Second derivative

% Define x range
x = linspace(-10, 10, 500);

% Evaluate functions
y  = f(x);
y1 = f1(x);
y2 = f2(x);

% Plot
figure;
plot(x, y, 'b', 'LineWidth', 2); hold on;
plot(x, y1, 'r--', 'LineWidth', 2);
plot(x, y2, 'g-.', 'LineWidth', 2);

% Labels and formatting
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
title('Polynomial Function and its Derivatives', 'FontSize', 16);
legend('f(x)', 'f''(x)', 'f''''(x)', 'Location', 'best', 'FontSize', 12);
grid on;

