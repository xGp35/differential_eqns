% Define constants
a = 2;
b = 2;
c = 1;

% Define the range for x and y
x = linspace(-3, 3, 50);
y = linspace(-3, 3, 50);

% Create a meshgrid
[X, Y] = meshgrid(x, y);

% Compute Z for both positive and negative sheets
Z_square = (X.^2 / a^2) + (Y.^2 / b^2) - 1; % Rearranged hyperboloid equation

% Only take real values where Z^2 is positive
valid_idx = Z_square >= 0;
Z_pos = zeros(size(Z_square));
Z_neg = zeros(size(Z_square));

% Compute Z only where it's valid
Z_pos(valid_idx) = sqrt(Z_square(valid_idx)) * c;
Z_neg(valid_idx) = -sqrt(Z_square(valid_idx)) * c;

% Plot the hyperboloid sheets
figure;
hold on;
surf(X, Y, Z_pos, 'FaceAlpha', 0.7, 'EdgeColor', 'none'); % Positive sheet
surf(X, Y, Z_neg, 'FaceAlpha', 0.7, 'EdgeColor', 'none'); % Negative sheet

% Formatting
xlabel('X-axis', 'FontSize', 14);
ylabel('Y-axis', 'FontSize', 14);
zlabel('Z-axis', 'FontSize', 14);
title('Hyperboloid of Two Sheets', 'FontSize', 16);
colormap jet;
colorbar;
grid on;
axis equal; % Ensure aspect ratio is equal for all axes
view(3); % Set 3D view
hold off;

