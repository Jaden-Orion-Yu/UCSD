clear;clc;
%% Problem 1
%
% Objective: calculate the approximate root of the three functions
%   x1 = 1/4*sin(x1 + x2 + atan(x3/2))
%   x2 = 1/4*cos(x1 + x2 + atan(x3/2))
%   x3 = 1 + 1/4*cos(x1 + (0*x2) + atan(x3/2))
%
% Functions called
%   fixedPnt
%
%   Setting all the functions 
f1 = @(x1,x2,x3) (1/4)*sin(x1 + x2 + atan(x3/2)); 
f2 = @(x1,x2,x3) (1/4)*cos(x1 + x2 + atan(x3/2)); 
f3 = @(x1,x2,x3) 1 + ((1/4)*cos(x1 + (0*x2) + atan(x3/2))); 
%
% Setting the vertical function array F
% 
F = {f1,f2,f3};
%
%
%
%% Part A
%
%   This part hax the first x arary inputs of X1 = [3;2;1] and calls fixedPnt
%   with n = 1, then n = 2, then n = 3 
%
X1 = [3,2,1];
a_1Iteration = fixedPnt(F,X1,1);
a_2Iteration = fixedPnt(F,X1,2);
a_3Iteration = fixedPnt(F,X1,3);
%
% The next while loop repeats until the error reaches less than 10^-4
%
e = 10^-4;
a_count = 1;
Xa_n = X1;
Xa_nplus = a_1Iteration;
while abs(norm(Xa_nplus) - norm(Xa_n)) >= e 
    a_count = a_count +1;
    Xa_n = Xa_nplus;
    Xa_nplus = fixedPnt(F, Xa_n, a_count);
end
%% Part B
%
% This part hax the first x arary inputs of X1 = [300;200;100] and calls fixedPnt
%   with n = 1, then n = 2, then n = 3 
%
X2 = [300,200,100];
b_1Iteration = fixedPnt(F,X2,1);
b_2Iteration = fixedPnt(F,X2,2);
b_3Iteration = fixedPnt(F,X2,3);
%
%The next while loop repeats until the error reaches less than 10^-4
%
b_count = 1;
Xb_n = X2;
Xb_nplus = b_1Iteration;
while abs(norm(Xb_nplus) - norm(Xb_n)) >= e
    b_count = b_count +1;
    Xb_n = Xb_nplus;
    Xb_nplus = fixedPnt(F, Xb_n, b_count);
end
