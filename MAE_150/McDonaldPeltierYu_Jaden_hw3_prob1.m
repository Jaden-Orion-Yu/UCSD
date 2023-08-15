%% Problem 1
% Setting the function
f = @(k,m,ms) (1/(2*(22/7)))*sqrt(k./(m+(ms./3)));

% Setting number of random numbers
n = 100000;

% settin nominal and error values
k_num = 40;
k_er = 0.8;
m_num = 2;
m_er = 0.2;
ms_num = 0.4;
ms_er = 0.05;

fn_nominal  = f(k_num,m_num,ms_num);

%% part a 

% generating random numbers for uniform distribution
r1 = rand(n,1);
k = ((k_num+k_er) - (k_num-k_er)).*r1 + (k_num-k_er);

r2 = rand(n,1);
m = ((m_num+m_er) - (m_num-m_er)).*r2 + (m_num-m_er);

r3 = rand(n,1);
ms = ((ms_num+ms_er) - (ms_num-ms_er)).*r3 + (ms_num-ms_er);

fn_unif = f(k,m,ms);

% generating randum numbers for normal distribution and c

rn1 = randn(n,1);

rn2 = randn(n,1);

rn3 = randn(n,1);

% calculating std dev
k_stdv = k_er/3;
m_stdv = m_er/3;
ms_stdv = ms_er/3;

% calculating normal dist of the variables
kn = k_num + rn1.*k_stdv;
mn = m_num + rn2.*m_stdv;
msn = ms_num + rn3.*ms_stdv;

fn_norm = f(kn,mn,msn);

%plottign all vars and fn
figure(1);
tiledlayout(2,2)

nexttile
histogram(k,50)
title('k variable uniform distribution')
xlabel('N/m')
ylabel('occurence')

nexttile
histogram(m,50)
title('m variable uniform distribution')
xlabel('kg')
ylabel('occurence')

nexttile
histogram(ms,50)
title('ms variable uniform distribution')
xlabel('kg')
ylabel('occurence')

nexttile
histogram(fn_unif,50)
title('fn uniform distribution')
xlabel('Hz')
ylabel('occurence')

figure(2)
tiledlayout(2,2)
nexttile
histogram(kn,50)
title('k variable normal distribution')
xlabel('N/m')
ylabel('occurence')

nexttile
histogram(mn,50)
title('m variable normal distribution')
xlabel('kg')
ylabel('occurence')

nexttile
histogram(msn,50)
title('ms variable normal distribution')
xlabel('kg')
ylabel('occurence')

nexttile
histogram(fn_norm,50)
title('fn normal distribution')
xlabel('Hz')
ylabel('occurence')


%% part B

%plotting the uniform fn vairable with the nominal and mean value
figure(3);
histogram(fn_unif,50);
hold on;
tempY1 = 1:50:3000;
meanX1 = zeros(1, length(tempY1));
meanX1 = meanX1 + mean(fn_unif); 
nominalX1 = zeros(1, length(tempY1));
nominalX1 = nominalX1 + fn_nominal;
plot(nominalX1,tempY1,'r*')
hold on
plot(meanX1,tempY1,'yo')
xlabel('hz')
ylabel('occurence')
legend('fn uniform', 'nominal value','mean value')

%plotting the normal fn vairable with the nominal and mean value
figure(4)
histogram(fn_norm,50);
tempY2 = 1:50:8000;
meanX2 = zeros(1, length(tempY1));
meanX2 = meanX2 + mean(fn_norm); 
nominalX2 = zeros(1, length(tempY2));
nominalX2 = nominalX2 + fn_nominal;
hold on;
plot(nominalX2, tempY2,'r*')
hold on
plot(nominalX2,tempY2,'yo')
xlabel('hz')
ylabel('occurence')
legend('fn normal', 'nominal value','mean value')
