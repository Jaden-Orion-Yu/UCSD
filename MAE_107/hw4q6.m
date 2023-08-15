%%Problem 6
%
% Objective: Calculate the approximate integral of f(x) = (sin(pi*(1-x^2)))/(sqrt(2 + x^2))
% over the interval [a,b] using different integral approximation methods 
% (leftend, trapezoid, corrected trapezoid). The error of each approximation is
% measured with the cprrected trapezoidal approximation using n = 10^5. 
%
% Functions called
%   intLE
%   intTRAP
%   intCT
%
% Setting the k array, which is the values that define n
%
k = [1,2,3,4];
%
% creating the n array, which is an array of n-values that will be used in
% when calling intLE, intTRAP, intCT. each nvalue is n(i) = 10^k(i).
%
n = 10.^k;
%
%   Setting a and b, which are the beginning and endpoints for the integral
%
a = 0;
b = 3;
%
% Setting the value of the function f that is the given function that needs
% to be integrated. The fInt is the true integrated function that we are
% trying to approximate
%
f = @(x) (sin(pi*(1-x^2)))/(sqrt(2 + x^2)); 
%
% Setting the true value of the integral of f over [a,b] is used to calculate the error for
% each approximation
%
trueVal = intCT(f,10^5,a,b);
%
% Setting up the arrays that will contain the errors from each integral
% approximation
%
eLE= zeros(1,4);
eTRAP= zeros(1,4);
eCT = zeros(1,4);
%
%   for loop iterates from one to length(k) to get the error of each
%   integral aproximation method for the given n value, which is e = |F(x) - int(x)|
%   where F(x) is the integrated function and int(x) is the approximation.
%
for i = 1:1:length(k)
    %
    % for each value of i, the for loop calculates the error for each
    % integration method and puts them in the relavent error arrays. 
    %
    eLE(i) = abs(trueVal - intLE(f, n(i), a, b));
    eTRAP(i) = abs(trueVal - intTRAP(f, n(i), a, b));
    eCT(i) = abs(trueVal - intCT(f, n(i), a, b));
end
%
% Creating a plot with log10(eLE), log10(eTRAP), log(eCT), all agianst log10(n).
%
plot(log10(n),log10(eLE), 'r','Linewidth',5)
hold on;
plot(log10(n), log10(eTRAP), 'g','Linewidth',2)
plot(log10(n),log10(eCT), 'b','Linewidth',2)
%
% Adding a legend to the plot
%
legend('log10(eLE)', 'log10(eTRAP)','log10(eCT)','Location', 'northeast');
%
% Adding Axis labels and title and adding grid
%
xlabel('log10(n)')
ylabel('log10(error)')
title('Question 6')
grid on
hold off;