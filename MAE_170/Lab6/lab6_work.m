% Obtaining curves for ln(theta) vs tau
clear;clc;

%setting variables
rowAcr = 1180;
rowAlu = 2707;
cAcr = 2000;
cAlu = 879;
kAlu = 204;
kAcr = 0.2;
d = 0.00081;
w = 0.0381;
A = w*w;
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
plot(tauAlFree1,log(thetaAlFree1), '-.r')
hold on;
plot(tauAlFree2,log(thetaAlFree2), '--b');
hold on;
plot(tauAlFree3,log(thetaAlFree3), '.g');
legend('Al Free 1','Al Free 2','Al Free 3','interpreter','latex','FontSize',12);
title('Aluminum Free Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)

subplot(2,2,2)
plot(tauAlForced1,log(thetaAlForced1), '-.r')
hold on;
plot(tauAlForced2,log(thetaAlForced2), '--b');
hold on;
plot(tauAlForced3,log(thetaAlForced3), '.g');
legend('Al Forced 1','Al Forced 2','Al Forced 3','interpreter','latex','FontSize',12);
title('Aluminum Forced Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)


subplot(2,2,3)
plot(tauAcFree1,log(thetaAcFree1), '-.r')
hold on;
plot(tauAcFree2,log(thetaAcFree2), '--b');
hold on;
plot(tauAcFree3,log(thetaAcFree3), '.g');
legend('Ac Free 1','Ac Free 2','Ac Free 3','interpreter','latex','FontSize',12);
title('Acrylic Free Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)


subplot(2,2,4)
plot(tauAcForced1,log(thetaAcForced1), '-.r')
hold on;
plot(tauAcForced2,log(thetaAcForced2), '--b');
hold on;
plot(tauAcForced3,log(thetaAcForced3), '.g');
legend('Ac Forced 1','Ac Forced 2','Ac Forced 3','interpreter','latex','FontSize',12);
title('Acrylic Forced Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)

%% linear regression 
fitAlFree1 = polyfit(tauAlFree1,log(thetaAlFree1),1);
fitAlFree2 = polyfit(tauAlFree2,log(thetaAlFree2),1);

fitAlForced2 = polyfit(tauAlForced2,log(thetaAlForced2),1);
fitAlForced3 = polyfit(tauAlForced3,log(thetaAlForced3),1);

fitAcFree1 = polyfit(tauAcFree1,log(thetaAcFree1),1);
fitAcFree2 = polyfit(tauAcFree2,log(thetaAcFree2),1);
fitAcFree3 = polyfit(tauAcFree3,log(thetaAcFree3),1);

fitAcForced1 = polyfit(tauAcForced1,log(thetaAcForced1),1);
fitAcForced2 = polyfit(tauAcForced2,log(thetaAcForced2),1);
fitAcForced3 = polyfit(tauAcForced3,log(thetaAcForced3),1);


%plotting
figure(2)
subplot(2,2,1)
plot(tauAlFree1,fitAlFree1(1).*tauAlFree1, '-.r')
hold on;
plot(tauAlFree2,fitAlFree2(1).*tauAlFree2,  '--b')
legend('Al Free 1','Al Free 2','interpreter','latex','FontSize',12);
title('Aluminum Free Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)

subplot(2,2,2)
plot(tauAlForced2,fitAlForced2(1).*tauAlForced2, '--b')
hold on;
plot(tauAlForced3,fitAlForced3(1).*tauAlForced3, '.g')
legend('Al Forced 2','Al Forced 3','interpreter','latex','FontSize',12);
title('Aluminum Forced Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)

subplot(2,2,3)
plot(tauAcFree1,fitAcFree1(1).*tauAcFree1, '-.r')
hold on;
plot(tauAcFree2,fitAcFree2(1).*tauAcFree2, '--b')
hold on;
plot(tauAcFree3,fitAcFree3(1).*tauAcFree3,'.g');
legend('Ac Free 1','Ac Free 2','Ac Free 3','interpreter','latex','FontSize',12);
title('Acrylic Free Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)

subplot(2,2,4)
plot(tauAcForced1,fitAcForced1(1).*tauAcForced1, '-.r')
hold on;
plot(tauAcForced2,fitAcForced2(1).*tauAcForced2, '--b')
hold on;
plot(tauAcForced3,fitAcForced3(1).*tauAcForced3, '.g');
legend('Ac Forced 1','Ac Forced 2','Ac Forced 3','interpreter','latex','FontSize',12);
title('Acrylic Forced Convection','interpreter','latex','FontSize',30)
ylabel('ln(theta)','interpreter','latex','FontSize',30)
xlabel('Tau','interpreter','latex','FontSize',30)


%% calculating h_bar and Biot Number
biotAlFree = -((fitAlFree1(1) + fitAlFree2(1))/2) ;

biotAlForced = -((fitAlForced2(1) + fitAlForced3(1))/2); 

biotAcFree = -((fitAcFree1(1) + fitAcFree2(1) + fitAcFree3(1) )/3);

biotAcForced = -((fitAcForced1(1) + fitAcForced2(1) + fitAcForced3(1))/3);

hAlFree = biotAlFree*kAlu/(V/A);

hAlForced = biotAlForced*kAlu/(V/A);

hAcFree = biotAcFree*kAcr/(V/A);

hAcForced = biotAcForced*kAcr/(V/A);
