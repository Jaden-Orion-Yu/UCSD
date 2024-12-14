clear;clc;

%% p4
S4 = [17 40 225 50 120 220 190 155 160 170 ];
s4 = sqrt(var(S4));
V4 = norminv(.95);

%% p5
S5 = [88 75 85 90 80 92 78 95 82];
mean5 =mean(S5);
std_s5 = sqrt(var(S5));

%% p6
V = [125 30 65 95 60 25 65 15 50 100 9 40];
D = [45 8 24 30 25 5 25 4 15 40 2 15];

figure(1)
plot(V,D,'*')
xlabel('Speed of Travel (km/h)')
ylabel('Distance of Travel (km)')
grid on

Xmean = mean(V);
Ymean = mean(D);
n = length(D);
sum_MNum = 0;
sum_MDem = 0;
Xvar = var(V);
Yvar = var(D);
Xstd = sqrt(Xvar);
Ystd = sqrt(Yvar);
for i = 1:n
    sum_MNum = sum_MNum + (V(i)*D(i));
    sum_MDem = sum_MDem + (V(i)^2) ;
end
sum_MDem = sum_MDem - (n*Xmean^2);
sum_MNum = sum_MNum  - (n*Xmean*Ymean);
b = sum_MNum/sum_MDem;
a = Ymean - b*Xmean;
SSE = 0;

for i = 1:n
    SSE = SSE + (D(i) -  (a*V(i) + b))^2;
end

convar = SSE/(n-2);
p = 0;
for i = 1:n
    p = p+ (V(i)*D(i));
end

p = (p - n*Xmean*Ymean )/(Xstd*Ystd*(n-1));

confintvar = 0;

for i = 1:n
    confintvar = confintvar + (V(i) - Xmean)^2;
end

cofinvar = 1.7959 * sqrt(convar/confintvar);


%% Problem 7
clear;clc;
X = [10300 8600 5400 3100 4200 2900 2700 600];
Y = [4000 2500 2700 2500 2000 1400 700 1000];
Xbar = mean(X);
Ybar = mean(Y);
Xv = var(X);
Yv = var(Y);
Xstdv = sqrt(Xv);
Ystdv = sqrt(Yv);
n = length(X);
num = 0;
dem = 0;
for i = 1:n
    num = num + (X(i)*Y(i));
    dem = dem + (X(i)^2) ;
end
dem = dem - (n*Xbar^2);
num = num  - (n*Xbar*Ybar);
m = num/dem;
b = Ybar - m*Xbar;

x = linspace(min(X),max(X),11);
figure(2)
plot(X,Y,'*r')
hold on
plot(x, m.*x + b)
xlabel('GNP')
ylabel('Energy Consumption')
grid on;
hold on
SSE7 = 0;
for i = 1:n
    SSE7 = SSE7 + (Y(i) -  (m*X(i) + b))^2;
end
convar7 = SSE7/(n-2);
syx = sqrt(convar7);
p7 = 0;
for i = 1:n
    p7 = p7+ (X(i)*Y(i));
end
p7 = (p7 - n*Xbar*Ybar )/(Xstdv*Ystdv*(n-1));

Mconfintvar7 = 0;

for i = 1:n
    Mconfintvar7 = Mconfintvar7 + (X(i) - Xbar)^2;
end

Mconfintvar7 =  2.4469* syx/sqrt(Mconfintvar7);

MCI = [m-Mconfintvar7, m+Mconfintvar7];

Bconfintvar7 = 2.4469*(syx*sqrt(sum(X.^2)))/(8*sqrt(sum((X-Xbar).^2)));

BCI = [b-Bconfintvar7, b+Bconfintvar7];


plot(x,MCI(1)*x + BCI(1), '--r')
plot(x,MCI(2)*x + BCI(2), '--r')

%% P8
clear;clc;

%% Input parameters:
mu_C = 1.8;
% cov_C = ...;
zeta_C = 0.198;
lambda_C = 0.5682;
 
mu_R = 2.3*10^-3;
% cov_R = ...
zeta_R = 0.1;
lambda_R = -6.0798;
 
mu_V = 120;
% cov_V = ...
zeta_V = 0.4294;
lambda_V = 4.6953;

%% Generate random numbers for Monte-Carlo simulation
np = 10000;                           % sample size 
C = lognrnd(lambda_C, zeta_C,[np,1]); % random number for C
R = lognrnd(lambda_R, zeta_R,[np,1]);                   % random number for R
V = lognrnd(lambda_V, zeta_V,[np,1]);                   % random number for V

%% Obtain pressure P:
P = 0.5*C.*R.*V.^2;

%% Create historgram of simulated presssure
figure(3);
histogram(P, 'NumBins', 100, 'Normalization', 'pdf');
box on; grid on;
xlabel('Pressure (lb/ft^2)')
ylabel('PDF');
set(gca,'FontSize',14);
p8a = 'See figure 3'

%% Fit a lognormal distribution to P
p8b = fitdist(P,'lognormal')

%% Compute probability of pressure > 30
p8c = 1-normcdf(log(30),1.1183983,0.075783)