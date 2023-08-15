clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 2;

%%
% problem 1
p1a = linspace(2, 998, 499);
p1b = 1:2:999;
p1c = [p1b, p1a];
p1d = length(p1c);
p1e = find(p1c==500); 
p1f = [0, p1c];
p1g = [p1f(251:500)];
p1h = [p1f(751:end)];
p1i = -1:-2:-1999;
p1j = p1i.^2;
p1k = sum(p1i);
p1l = prod(p1i(996:end));
p1m = cumsum(p1i);

%% problem 2
p2a = ones(5).*7;
p2b = p2a;
p2b(:,2) = 2;
p2c = p2b.';
p2d = rot90(p2b,3);
p2e = p2d == p2c; %is this a viable form to answer the question

%% problem 3
p3a = [1 2; 3 4];
p3a = [p3a zeros(2) (ones(2)*5) zeros(2) fliplr(p3a); 
    zeros(2) p3a (ones(2) *5) fliplr(p3a) zeros(2); 
    (ones(2, 4)*5) p3a (ones(2,4)*5); 
    zeros(2) fliplr(p3a) (ones(2)*5) p3a zeros(2) ; 
    fliplr(p3a) zeros(2) (ones(2)*5) zeros(2) p3a];
p3b = sum(p3a(:,5));
p3c = sum(diag(p3a)) + sum(diag(fliplr(p3a)));
p3d = sum(sum(p3a));
p3e = find(p3a>2);



%% Problem 4
p4a = 2:2:50;
p4b = 3:2:51;
p4c = [repmat([-1 ,1 ], 1,12), -1];
p4d = 1 + sum(p4c*(p4a/p4b));

%% problem 5
A = [2 5 10; 3 8 5];
B = [8 3; 7 4; 2 1];
C = [2 4 6; 1 2 3; 3 5 7];
D = [1 3; 5 7];

p5a = 'error';
p5b = A * B;
p5c = A * C;
p5d = 'error';
p5e = B*A;
p5f = B*D;
p5g = 'error';
p5h = C^2;
p5i = D^2;
p5j = isequal((A*B),(B*A));

%% Problem 6
X = [4 1 1 1; 1 4 1 1; 1 1 4 1; 1 1 1 4];
b = [0; 2; 4; 6];
p6a = X\b;
p6b = inv(X)*b;
p6c = isequal(p6a,p6b);
p6d = abs(p6a-p6b);

