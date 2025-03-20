% Load the symbolic package (only needed once per session)
pkg load symbolic

% Define the range of x values
x = linspace(-3, 3, 1000);

% Define the polynomial P(x)
P = @(x) x.^5 - 4*x.^4 + 3*x.^3 - 2*x.^2 + x - 1;

% Compute derivatives manually
P1 = @(x) 5*x.^4 - 16*x.^3 + 9*x.^2 - 4*x + 1;  % First derivative P'(x)
P2 = @(x) 20*x.^3 - 48*x.^2 + 18*x - 4;        % Second derivative P''(x)

% Plot P(x), P'(x), and P''(x)
figure;
hold on;
plot(x, P(x), 'b', 'LineWidth', 2);   % P(x) in Blue
plot(x, P1(x), 'r', 'LineWidth', 2);  % P'(x) in Red
plot(x, P2(x), 'g', 'LineWidth', 2);  % P''(x) in Green


% Increase font sizes for labels, title, and legend
xlabel('x', 'FontSize', 14);
ylabel('Function Values', 'FontSize', 14);
title('Plot of P(x), P''(x), and P''''(x)', 'FontSize', 16);
legend('P(x)', 'P''(x)', 'P''''(x)', 'FontSize', 12);

grid on;
hold off;

