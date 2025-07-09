clc;
clear;

% Limits of integration
a = 0;
b = 6;

% Number of intervals (must be even)
n = 6;
h = (b - a)/n;

% x values
x = a:h:b;

% Function values
f = @(x) 1./(1 + x.^2);
y = f(x);

% Apply Simpson's 1/3rd rule
I = y(1) + y(end); % f(x0) + f(xn)

for i = 2:n
    if mod(i,2) == 0  % even index (odd x_i)
        I = I + 4*y(i);
    else              % odd index (even x_i)
        I = I + 2*y(i);
    end
end

I = (h/3) * I;

% Display result
fprintf('Approximate value of the integral = %.6f\n', I);

% Optional: Plot the function
xx = linspace(a, b, 1000);
yy = f(xx);
figure;
plot(xx, yy, 'b', 'LineWidth', 2);
xlabel('x', 'FontSize', 14); ylabel('f(x)', 'FontSize', 14);
title('f(x) = 1 / (1 + x^2)', 'FontSize', 16);
grid on;

