% Q1: Apply Leibniz test to alternating harmonic series
clc; clear; close all;

% Use qt graphics toolkit for proper labels/legends
graphics_toolkit("qt");

N = 100; % number of terms
n = 1:N;
terms = (-1).^n ./ n;    % series terms
partial_sums = cumsum(terms);

% Limit value
limit_val = -log(2);

% Plot partial sums
figure;
plot(n, partial_sums, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4); hold on;

% Replacement for yline in Octave:
plot([1 N], [limit_val limit_val], 'r--', 'LineWidth', 2);

xlabel('Number of terms (n)', 'FontSize', 14);
ylabel('Partial Sum', 'FontSize', 14);
title('Alternating Harmonic Series: Leibniz Test', 'FontSize', 16);
legend('Partial Sums', 'Limit (-ln(2))', 'Location', 'best', 'FontSize', 12);
grid on;

drawnow;  % force figure update

