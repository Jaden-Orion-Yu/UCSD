clear;
clc;
num = [ 1 3 4 9];
den = [ 1 2 2 1];
sys = tf(num,den);
sysss = ss(sys);
[A, B, C, D] = ssdata(sysss);

eigA = eig(A);
rootsDen = roots(den);

(eigA == rootsDen);


syms s
SIminusA = s*eye(3) - A;
detSIminusA = det(SIminusA);



partC = D + C/(s*eye(3) - A) * B;

partCsimplified = simplifyFraction(partC);

syms a1 a2 a3 a4 a5

A_D = [0 1 0 0 0;
       0 0 1 0 0;
       0 0 0 1 0;
       0 0 0 0 1;
       -a5 -a4 -a3 -a2 -a1]
partD = (s*eye(5) - A_D)
detPartD = det(partD)