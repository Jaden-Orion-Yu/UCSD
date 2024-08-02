clear;clc;

%problem 4, step response
A = [1 1; 0 1];
B = [0.5;1];
C = [1 0];
D = [0];

x_0 = [0;1];

X = zeros(2,11);
X(:,1) = x_0;


Y = zeros(2,11);
y_0 = funcY(x_0, C, D); 
Y(:,1) = y_0;


for i = 2:11
    tempX = funcX(X(:,(i-1)), A, B );
    tempY = funcY(tempX, C, D);
    X(:,i) = tempX;
    Y(:,i) = tempY;
end

function y = funcY(x, C, D)
    y = C*x + D;
end

function x = funcX(x_prev, A, B)
    x = A*x_prev + B;
end