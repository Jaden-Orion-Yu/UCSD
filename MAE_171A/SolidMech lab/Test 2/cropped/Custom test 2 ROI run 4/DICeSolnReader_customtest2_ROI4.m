% DICe result reader, N. Boechler (1/2023)
% put this in a folder with your DICe_solution_0*.txt files

clc;
clear all;
close all;

meanstrain_yy = zeros(1,4);
meanstrain_xx = zeros(1,4);

time = [10:10:40];
for i = 0:3
    if(i == 0)
    mydata=readmatrix('DICe_solution_0.txt');
    strain_yy=mydata(:,12);
    strain_xx=mydata(:,11);
    meanstrain_xx(i+1) = mean(strain_xx);
    meanstrain_yy(i+1) = mean(strain_yy);
    elseif i < 10
    mydata=readmatrix(['DICe_solution_' int2str(i) '.txt']);
    strain_yy=mydata(:,12);
    strain_xx=mydata(:,11);
    meanstrain_xx(i+1) = mean(strain_xx);
    meanstrain_yy(i+1) = mean(strain_yy);
    else
    mydata=readmatrix(['DICe_solution_' int2str(i) '.txt']);
    strain_yy=mydata(:,12);
    strain_xx=mydata(:,11);
    meanstrain_xx(i+1) = mean(strain_xx);
    meanstrain_yy(i+1) = mean(strain_yy);  
    end
end
poisson = (-1).*meanstrain_xx./meanstrain_yy;

figure(1)
subplot(3,1,1)
plot(time,meanstrain_yy)
xlabel('time')
ylabel('strain YY')
subplot(3,1,2)
plot(time,meanstrain_xx)
xlabel('time')
ylabel('strain XX')
subplot(3,1,3)
plot(time,poisson);
xlabel('time')
ylabel('Poissons ratio')
yline(mean(poisson))
legend('poinsson ratio overtime', 'Mean poisson ratio')

poissonmean = mean(poisson);



% 
% figure(01)
% scatter(xpos,ypos,[],strain_yy,'filled')
% colorbar
% xlabel('x')
% ylabel('y')
% set(gca,'fontsize',20,'linewidth',2)

%% helpers
function [sum] = customsum(array)
    sum = 0;
    for i = 1:length(array)
        sum = sum + array(i);
    end
    sum = sum/length(array);
end