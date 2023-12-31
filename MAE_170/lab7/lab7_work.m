% clear;
% clc;
% load('lab7Workspace_actual.mat');

%setup an adjusted angle vector (for total accumulated angle)
fps = 30;

adjustedangle=angled;
for i=2:frames
    if angled(i)<180 && angled(i-1)>180 % check for crossing from 360 to 0
        adjustedangle(i:frames)=adjustedangle(i:frames)+360;
    end
    % check for >180 degree motion
    if adjustedangle(i)-adjustedangle(i-1)>180
    % if so, undo the prior addition
        adjustedangle(i:frames)=adjustedangle(i:frames)-360;
    end
end

angles = [angled;adjustedangle];


t = linspace(0,(200/30),200);

rpm = [];
rpm(1) = 0;
for i = 2:200
    rpm(i) = (deg2rad(adjustedangle(i) - adjustedangle(i-1)/(2*pi)) / (t(i) - t(i-1)))*60
end

figure(1)
subplot(3,1,1)
plot(t,angled,'-r')
title('angle V time','interpreter','latex','FontSize',20)
xlabel('t (s)','interpreter','latex','FontSize',15)
ylabel('angle (deg)','interpreter','latex','FontSize',15)
grid on

subplot(3,1,2)
plot(t,adjustedangle,'-g')
title('total angle traversed  V time','interpreter','latex','FontSize',15)
xlabel('t (s)','interpreter','latex','FontSize',15)
ylabel('total angle traversed (deg)','interpreter','latex','FontSize',15)
grid on

subplot(3,1,3)
plot(t,rpm,'-b')
title('RPM  V time','interpreter','latex','FontSize',15)
xlabel('t (s)','interpreter','latex','FontSize',15)
ylabel('RPM (rot/min)','interpreter','latex','FontSize',15)
grid on


