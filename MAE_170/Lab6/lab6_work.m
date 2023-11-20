% Obtaining curves for ln(theta) vs tau
clear;clc;

%setting variables
rowAcr = 1180;
rowAlu = 2707;
cAcr = 2000;
cAlu = 879;
kAcr = 204;
kAlu = 0.2;
d = 0.00081;
w = 0.0381;
A = w^2;
V = (A*d);
thetaFunc = @(T, Tinf, T0) (T-Tinf)./(T0 - Tinf);
tau = @(t,k,row,c) (k.*A.*t)./(row.*c.*d*V);
%% Aluminum Free
load('aluminum_free_1.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlFree1 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlFree1 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end
load('aluminum_free_2.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlFree2 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlFree2 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end
load('aluminum_free_3.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlFree3 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlFree3 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end

%% aluminum forced
load('aluminum_forced_1.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlForced1 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlForced1 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end
load('aluminum_forced_2.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlForced2 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlForced2 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end
load('aluminum_forced_3.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAlForced3 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAlForced3 = tau(time(i:end),kAlu,rowAlu,cAlu);
        break
    end
end

%% Acrylic free
load('acrylic_free_1.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcFree1 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcFree1 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
load('acrylic_free_2.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcFree2 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcFree2 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
load('acrylic_free_3.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcFree3 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcFree3 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
%% Acrylic forced
load('acrylic_forced_1.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcForced1 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcForced1 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
load('acrylic_forced_2.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcForced2 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcForced2 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
load('acrylic_forced_3.mat');
for i = 1:length(time)
    if tempPlateC(i + 1) - tempPlateC(i) < 0
        thetaAcForced3 = thetaFunc(tempPlateC(i:end), tempAmbC(i:end),tempPlateC(i));
        tauAcForced3 = tau(time(i:end),kAcr,rowAcr,cAcr);
        break
    end
end
%% Plotting
figure(1);
subplot(2,2,1)
plot(log(thetaAlFree1),tauAlFree1, '-.r')
hold on;
plot(log(thetaAlFree2),tauAlFree2, '--b');
hold on;
plot(log(thetaAlFree3),tauAlFree3, '.g');
legend('Al Free 1','Al Free 2','Al Free 3');
title('Aluminum Free Convection ln(theta) vs Tau')
xlabel('ln(theta)')
ylabel('Tau')

subplot(2,2,2)
plot(log(thetaAlForced1),tauAlForced1, '-.r')
hold on;
plot(log(thetaAlForced2),tauAlForced2, '--b');
hold on;
plot(log(thetaAlForced3),tauAlForced3, '.g');
legend('Al Forced 1','Al Forced 2','Al Forced 3');
title('Aluminum Forced Convection  ln(theta) vs Tau')
xlabel('ln(theta)')
ylabel('Tau')


subplot(2,2,3)
plot(log(thetaAcFree1),tauAcFree1, '-.r')
hold on;
plot(log(thetaAcFree2),tauAcFree2, '--b');
hold on;
plot(log(thetaAcFree3),tauAcFree3, '.g');
legend('Ac Free 1','Ac Free 2','Ac Free 3');
title('Acrylic Free Convection ln(theta) vs Tau')
xlabel('ln(theta)')
ylabel('Tau')


subplot(2,2,4)
plot(log(thetaAcForced1),tauAcForced1, '-.r')
hold on;
plot(log(thetaAcForced2),tauAcForced2, '--b');
hold on;
plot(log(thetaAcForced3),tauAcForced3, '.g');
legend('Ac Forced 1','Ac Forced 2','Ac Forced 3');
title('Acrylic Forced Convection ln(theta) vs Tau')
xlabel('ln(theta)')
ylabel('Tau')

