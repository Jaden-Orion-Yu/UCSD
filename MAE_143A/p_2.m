close all;
clear all;
clc;
% Define the new coefficients
ao = 4/pi;
an = @(n) -2 * (cos(2*pi*n) + 1) / (pi * (4*n^2 - 1));
bn = @(n) 0;  % Since the new expression for a0 doesn't have a sin term

% Define the period of the function
L = 1/4;

% Define the Fourier series
N = 100;  % Number of terms in the series
fourier_series = @(x) ao/2 + sum(arrayfun(@(n) an(n) * cos(2*pi*n*x/L), 1:N));

% Generate x values
x_values = linspace(-10*L, 10*L, 1000);

% Evaluate the Fourier series at x_values
y_fourier_series = arrayfun(fourier_series, x_values);

% Plot the results
figure;
plot(x_values, y_fourier_series, 'b', 'LineWidth', 1);
xlabel('x');
ylabel('y');
title('Fourier Series Approximation');
grid on;
