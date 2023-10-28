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

plot(x1,y1,'--or')
hold on;
plot(x1, x1.*p1(1) + p1(2),'--bdiamond')
hold on;
grid on;
xlabel('freqeuncy [Hz]')
ylabel('normalized gain [Hz*ohm*F]')
title('Question 1')
legend('nomalized data','analytical equation')

%% Q2
figure(2)
x2 = lab4_1(:,1);
y2a = lab4_1(:,2);

for i = 10:20
    if y2a(i)<= 0.707
       cutoff_expect = i;
       break
    end
end


y2b = 1./sqrt((2.*pi.*x2.*p1(1)).^2 + 1);
for i = 10:20
    if y2b(i)<= 0.707
       cutoff_measured = i;
       break
    end
end

plot(x2,y2a, '-or');
hold on;
plot(x2,y2b, '-bdiamond');
hold on;
%maxline for each
yline(y2a(1),'*k')
yline(y2b(1),'xm')

%-3db line for each
xline(cutoff_expect,'-*k')
xline(cutoff_measured,'-xm')



