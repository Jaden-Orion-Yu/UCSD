clear;clc;

%p3 check
syms s X1 X2 X3 x1 x2 x3;

X1 = (s + 4)/((s*(s+2)*(s+3)));

X2 = (11*(s+1))/(s^2 + 121);

X3 = (1-exp(-8*s))*(2*s + 80)/((s+4)*(s+2));

x1 = ilaplace(X1);
x2 = ilaplace(X2);
x3 = ilaplace(X3);

%% p2 check
syms X Y;

e1 = (s*X) + (3*X) + (8*X) ==1;
e2 = (s*Y) + (3*Y) - (3*X) ==2;

sol = solve([e1,e2],[X,Y])

x = ilaplace(sol.X)
y = ilaplace(sol.Y)

