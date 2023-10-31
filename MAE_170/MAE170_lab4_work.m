clear all;
clc;
lab4_1 = csvread('MAE170_lab4.csv');
lab4_2 = csvread('MAE170_lab4_pt2.csv');
lab4_3 = csvread('MAE170_lab4_pt3.csv');


%% Q1
figure(1)
x1 = lab4_1(:,1);
y1 = lab4_1(:,2);

y1 = sqrt((1./(y1.^2)) - 1)./(2.*pi);
p1 = polyfit(x1,y1,1);

plot(x1,y1,'-or')
hold on;
plot(x1, x1.*p1(1) + p1(2),'--bdiamond')
hold on;
grid on;
xlabel('Frequency [Hz]','interpreter','latex','FontSize',30)
ylabel('Normalized Gain [Hz*ohm*F]','interpreter','latex','FontSize',30)
title('Question 1','interpreter','latex','FontSize',30)
legend(sprintf('Normalized Data \n'),sprintf('\n \n Analytical equation \n Y = 0.0083*X + 0.0134 \n RC = 0.0083'),'interpreter','latex','FontSize',12)

%% Q2
figure(2)
x2 = lab4_1(:,1);
y2a = 20*log10(lab4_1(:,2));
y2b = 20*log10(1./sqrt((2.*pi.*x2.*p1(1)).^2 + 1));
plot(x2,y2a, '-or');
hold on;
plot(x2,y2b, '-bdiamond');
hold on;
%maxline for each
yline(y2a(1),'--r')
yline(y2b(1),'-b',"LineWidth",3)
yline(-3,'-k')
ylim([-6,0.05])
xlim([1,30])

%cutoff frequency line for each
xline(17.35,'-.r')
xline(1/(2*pi*p1(1)),':b','LineWidth',3)

xlabel('Frequency [Hz]','interpreter','latex','FontSize',30)
ylabel('Gain [db]','interpreter','latex','FontSize',30)

legend('Measured Data','Expected Data','Measured Maxline','Estimated maxline','-3db line','Measured Cutoff Frequency','Estimated Cutoff Frequency','interpreter','latex','FontSize',12)

title('Question 2','interpreter','latex','FontSize',30)

%% Q4 (uses lab4_pt3 data)

figure(4)
x3 = lab4_3(:,1);
y3a = 20*log10(lab4_3(:,2));
y3b = 20*log10(2./sqrt((2.*pi.*x3.*p1(1)).^2 + 1));

plot(x3,y3a, '-or');
hold on;
plot(x3,y3b, '-bdiamond');
hold on;
%maxline for each
yline(y3a(1),'--r')
yline(y3b(1),'-b',"LineWidth",3)
yline(3,'-k')
 xlim([1,30])
%-3db line for each
xline(15.15,'-.r')
xline(1/(2*pi*p1(1)),':b','LineWidth',3)
xlabel('Frequency [Hz]','interpreter','latex','FontSize',30)
ylabel('Gain [db]','interpreter','latex','FontSize',30)
legend('Measured Data','Expected Data','Measured Maxline','Estimated maxline','-3 db','Measured Cutoff Frequency','Estimated Cutoff frequency','interpreter','latex','FontSize',12)
title('Question 4','interpreter','latex','FontSize',30)


