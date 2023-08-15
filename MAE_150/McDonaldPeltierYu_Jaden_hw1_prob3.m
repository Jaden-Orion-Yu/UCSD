%%problen 3
%input data
t = [0.5,1.1,1.6,2.1,2.6,3.2,3.7,4.2,4.7,5.3,5.8,6.3,6.8,7.4,7.9,8.4,8.9,9.5];
d = [1.3,1.8,2.9,4,8,16,26,42,65,96,137,191,259,343,447,520,600,650];
m = length(t);
%% part A
%finding linear coefficients
lb =[sum(d);sum(d.*t)];
lA = [m,sum(t);sum(t),sum(t.^2)];
la = lA\lb;
l0 = la(1);
l1 = la(2);

lin = @(t) l0 + t.*l1;

% finding quadratic coefficients
qA = [m,sum(t),sum(t.^2);sum(t),sum(t.^2),sum(t.^3);sum(t.^2),sum(t.^3),sum(t.^4)];
qb = [sum(d);sum(d.*t);sum(d.*(t.^2))];
qa = qA\qb;
q0 = qa(1);
q1 = qa(2);
q2 = qa(3);
quad = @(t) q0 + q1*t + q2*t.^2;

% finding cubic coefficients;
cA = [m,sum(t),sum(t.^2),sum(t.^3);sum(t),sum(t.^2),sum(t.^3),sum(t.^4);sum(t.^2),sum(t.^3),sum(t.^4),sum(t.^5);sum(t.^3),sum(t.^4),sum(t.^5),sum(t.^6);];
cb = [sum(d);sum(d.*t);sum(d.*(t.^2));sum(d.*(t.^3))];
ca = cA\cb;

c0 = ca(1);
c1 = ca(2);
c2 = ca(3);
c3 = ca(4);

cubic = @(t) c0 + c1*t + c2*t.^2 + c3*t.^3;

% finding exponential exponents
dPrime = log(d);
eb = [sum(dPrime);sum(dPrime.*t)];
eA = [m, sum(t); sum(t), sum(t.^2)];
ea = eA\eb;
e0 = ea(1);
e1 = ea(2);
b = exp(e0);
a = e1;

ex = @(t) b*exp(t.*a);


%% part B
% plotting part A
figure(1)
x = linspace(0,10);
ylin = lin(x);
yquad = quad(x);
ycubic = cubic(x);
yexp = ex(x);

scatter(t,d);
hold on
hold on
ylim([0,1000])
xlim([0,10])
hold on
plot(x,ylin,x,yquad,x,ycubic,x,yexp)
hold on
legend('data','linear','quadratic','cubic','exponential')
title('Best Fit Models for Time and Distance Data')
xlabel('t: time')
ylabel('d: distance')
%% Part C
%BF stands for best fit

% linear polyfit
pLin = polyfit(t,d,1);
l1BF = pLin(1);
l0BF = pLin(2);
linBF = @(t) l0BF + t.*l1BF;
sumLin = d - linBF(t);
rmsLin = sqrt((1/m)*sum(sumLin.^2));

% quadratic polyfit
pQuad = polyfit(t,d,2);
q2BF = pQuad(1);
q1BF = pQuad(2);
q0BF = pQuad(3);
quadBF = @(t) q0BF + q1BF*t + q2BF*t.^2;
sumQuad = d - quadBF(t);
rmsQuad = sqrt((1/m)*sum(sumQuad.^2));
% cubic polyfit
pCubic = polyfit(t,d,3);
c3BF = pCubic(1);
c2BF = pCubic(2);
c1BF = pCubic(3);
c0BF = pCubic(4);
cubicBF = @(t) c0BF + c1BF*t + c2BF*t.^2 + c3BF*t.^3;
sumCubic = d - cubicBF(t);
rmsCubic = sqrt((1/m)*sum(sumCubic.^2));
% exponential polyfit
pExp = polyfit(t,dPrime,1);
e1BF = pExp(1);
e0BF = pExp(2);
aBF = exp(e0BF);
bBF = e1BF;
exBF = @(t) b*exp(a*t);
sumExp = d - linBF(t);
rmsExp = sqrt((1/m)*sum(sumExp.^2));
