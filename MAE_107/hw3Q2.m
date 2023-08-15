
%% problem 2
%
% Objective: Caclulate the approximate derivative and its error for using
% the derAprox, derAproxHat, and derAproxTilde functions and steps of 
% h= 10^-j with j values from 0-10. Then graph the log of each together
% with the log of h to compare. The error of a derrivative approximation is
% |derAprox(x) - f'(x)|
%
% Functions called
%   derAprox
%   derAproxHat
%   derAproxTilde
%
% Setting the value of the function f1 that will be approximated and
% setting its derrivative.
f1 = @(x) exp(-2*x)*cos(pi*x);
df1 = @(x) (-exp(-2*x)*((pi*sin(pi*x)) + (2*cos(pi*x)) ));
%
% Setting the array of values that h will be to the power to
%
j = 0:1:10;
%
% setting empty arrays for the values of e, eHat, and eTilde, where the e
% stands for error
%
e = zeros(1,11);
eHat = zeros(1,11);
eTilde = zeros(1,11);
%
% Setting the empty h array
%
h = zeros(1,11);
%
% setting the value of xo that is used for the derrivative approximation
%
xo = 1;
%
% Starting the for loop to populate the e, eHat, eTilde, and h arrays. it
% iterates from 1 to 11 to use each value of j
%
for i = 1:1:length(j)
    %
    % Calling each derAprox function to compute the approximate 
    % derrivatives and populate the error arrays, using step as a temporary
    % variable
    %
    step = 10^(-j(i));
    e(i) = abs(derAprox(f1,xo,step) - df1(xo));
    eHat(i) = abs(derAproxHat(f1,xo,step) - df1(xo));
    eTilde(i) = abs(derAproxTilde(f1,xo,step) - df1(xo));
    h(i) = step;
end
%
% Creating a plot with log(e), log(eHat), log(eTilde), and log(h).
%
plot(log10(h),log10(e), 'r',log10(h),log10(eHat), 'g',log10(h),log10(eTilde), 'b')
%
% Adding a legend to the plot
%
legend('log10(e)', 'log10(eHat)','log10(eTilde)','Location', 'northwest');
%
% Adding Axis labels and title and adding grid
%
xlabel('log10(h)')
ylabel('log10(error)')
title('Question 2')
grid on
hold off;
