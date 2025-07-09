clc;
clear;

% Define the function and its derivative
f = @(x) x.^2 - 7;
df = @(x) 2*x;

% Initial guess
x0 = 2.5;

% Tolerance and max iterations
tol = 1e-4;
max_iter = 100;

% Store iteration values for plotting
x_vals = x0;

% Newton-Raphson Iteration
for i = 1:max_iter
    x1 = x0 - f(x0)/df(x0);
    x_vals(end+1) = x1;  % Store new approximation
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
end

% Plot convergence
figure;
plot(1:length(x_vals), x_vals, '-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Iteration Number', 'FontSize', 12);
ylabel('Approximation of \surd7', 'FontSize', 12);
title('Convergence of Newton-Raphson Method for \surd7', 'FontSize', 14);
grid on;

