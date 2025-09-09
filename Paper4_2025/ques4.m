% Q2: Partial sums of geometric and harmonic series
clc; clear; close all;

% Use qt graphics toolkit for proper labels/legends
graphics_toolkit("qt");

N = 50; % number of terms
n = 1:N;

% Geometric series with r = 0.5
r = 0.5;
geo_terms = r.^(n-1);   % start with n=0 term = 1
geo_partial = cumsum(geo_terms);

% Harmonic series
harm_terms = 1 ./ n;
harm_partial = cumsum(harm_terms);

%% Plot geometric series
figure;
plot(n, geo_partial, 'm-o', 'LineWidth', 1.5, 'MarkerSize', 4); hold on;
plot([1 N], [1/(1-r) 1/(1-r)], 'r--', 'LineWidth', 2); % replacement for yline

xlabel('Number of terms (n)', 'FontSize', 14);
ylabel('Partial Sum', 'FontSize', 14);
title('Convergence of Geometric Series (r = 0.5)', 'FontSize', 16);
legend('Partial Sums', 'Limit (1/(1-r))', 'Location', 'best');
grid on;

%% Plot harmonic series
figure;
plot(n, harm_partial, 'g-o', 'LineWidth', 1.5, 'MarkerSize', 4);

xlabel('Number of terms (n)', 'FontSize', 14);
ylabel('Partial Sum', 'FontSize', 14);
title('Divergence of Harmonic Series', 'FontSize', 16);
legend('Partial Sums', 'Location', 'best');
grid on;

drawnow;  % force update of figures

