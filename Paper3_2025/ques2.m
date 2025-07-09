clc;
clear;

% Given data
x = [0 2 4 6];
y = [2.2 4.2 5.2 8.6];

% Number of data points
n = length(x);

% Construct forward difference table
diff_table = zeros(n, n);
diff_table(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
end

% Compute u and interpolate at x = 2.3
x_interp = 2.3;
h = x(2) - x(1);
u = (x_interp - x(1)) / h;

% Newton Forward Formula
P = diff_table(1,1);
u_term = 1;

for i = 1:n-1
    u_term = u_term * (u - i + 1) / i;
    P = P + u_term * diff_table(1,i+1);
end

% Display result
fprintf('Interpolated value P(2.3) = %.4f\n', P);

% Plot
xx = linspace(min(x), max(x), 100);
yy = interp1(x, y, xx, 'spline');  % Smooth curve for visualization

figure;
plot(x, y, 'ro', 'MarkerSize', 8, 'DisplayName', 'Data Points'); hold on;
plot(xx, yy, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Spline Fit');
plot(x_interp, P, 'ks', 'MarkerFaceColor','g', 'DisplayName', 'P(2.3)');
legend show;
xlabel('x', 'FontSize', 12);
ylabel('f(x)', 'FontSize', 12);
title('Newton''s Interpolation and P(2.3)', 'FontSize', 16);
grid on;

