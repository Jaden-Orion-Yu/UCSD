close all; 
clear all;

% Given coefficients
a0 = 100;
an = @(n) -50 * ((cos(4*pi*n) + 2*pi*n*sin(2*pi*n) - cos(2*pi*n)) / (pi^2 * n^2));
bn = @(n) -50 * ((sin(4*pi*n) - 2*pi*n*cos(2*pi*n) - sin(2*pi*n)) / (pi^2 * n^2));
a1 = 200;
an1 = @(n) 100*(sin(6*pi*n)-sin(4*pi*n))/(n*pi);
bn1 = @(n) -100*(cos(6*pi*n)-cos(4*pi*n))/(n*pi);

% Define the period of the function
L = 2;

% Define the Fourier series for interval 2 to 4
N = 100;  % Number of terms in the series
fourier_series_2_to_4 = @(x) a0/2 + sum(arrayfun(@(n) an(n) * cos(2*pi*n*(mod(x, L))/L) + bn(n) * sin(2*pi*n*(mod(x, L))/L), 1:N));
fourier_series_4_to_6 = @(x) a1/2 + sum(arrayfun(@(n) an1(n) * cos(2*pi*n*(mod(x, L))/L) + bn1(n) * sin(2*pi*n*(mod(x, L))/L), 1:N));

% Generate x values over multiple periods
x_values = linspace(0, 6, 1000);  % Adjust the range based on the number of periods you want to display

% Evaluate the piecewise function periodically
y_piecewise = arrayfun(@(x) 0*(x<2) + fourier_series_2_to_4(x)*(x>=2 && x<4) + fourier_series_4_to_6(x)*(x>=4 && x<=6), x_values);

% Plot the results
figure;
plot(x_values, y_piecewise, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('Periodic Fourier Series Approximation');
grid on;
% Given coefficients and functions
% ... (same as in your original code)

% Define the fundamental frequency
f0 = 1 / L;

% Function to compute amplitude and phase for a given term
compute_amplitude_phase = @(an, bn) [sqrt(an.^2 + bn.^2), atan2(bn, an)];

% Compute amplitude and phase for the first five non-zero terms for [2, 4]
amp_phase_2_to_4 = zeros(5, 2);
for n = 1:5
    amp_phase_2_to_4(n, :) = compute_amplitude_phase(an(n), bn(n));
end

% Compute amplitude and phase for the first five non-zero terms for [4, 6]
amp_phase_4_to_6 = zeros(5, 2);
for n = 1:5
    amp_phase_4_to_6(n, :) = compute_amplitude_phase(an1(n), bn1(n));
end

% Plot line spectra for the first five non-zero terms
figure;
subplot(2, 1, 1);
stem(1:5, amp_phase_2_to_4(:, 1), 'r', 'LineWidth', 2);
xlabel('Term Index');
ylabel('Amplitude');
title('Amplitude Spectrum for [2, 4]');

subplot(2, 1, 2);
stem(1:5, amp_phase_2_to_4(:, 2), 'b', 'LineWidth', 2);
xlabel('Term Index');
ylabel('Phase (radians)');
title('Phase Spectrum for [2, 4]');

figure;
subplot(2, 1, 1);
stem(1:5, amp_phase_4_to_6(:, 1), 'r', 'LineWidth', 2);
xlabel('Term Index');
ylabel('Amplitude');
title('Amplitude Spectrum for [4, 6]');

subplot(2, 1, 2);
stem(1:5, amp_phase_4_to_6(:, 2), 'b', 'LineWidth', 2);
xlabel('Term Index');
ylabel('Phase (radians)');
title('Phase Spectrum for [4, 6]');
