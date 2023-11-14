clear;
clc;
% load('lab5_part2.mat');
% load('lab5_part1.mat');
% load('lab5_part1_badData.mat');
% load('part1b_70.mat');

%% Q2: 

figure(1)
plot(t*1e3,wave_sig,'-o','MarkerSize',2)
hold on
plot(t*1e3,recMatrix_sig,'-o','MarkerSize',2)
xlabel('time (ms)','interpreter','latex','FontSize',30)
ylabel('amp. (V)','interpreter','latex','FontSize',30)
%ylim([-1.1 1.1])
legend('64th signal', 'Average signal','interpreter','latex','FontSize',12)
title('Average Sig vs 64th Sig','interpreter','latex','FontSize',30);
set(gca,'FontSize',20,'LineWidth',2)

%% Q4
 clear;clc;
 load('lab5_part2.mat');
% lambda_1 = 340;
% 
% signal_averag_Diag = zeros(1,15);
% for i = 1:30
%     signal(i) = avg(recMatrixSig(:,5,i));
% end
% 
% 
% figure(4)
% 
% %plot()

%Ver 1
% 
% deltaT=[]
% 
% for j=15
%     for i=1:30
%         time_signal=find(recMatrix_sig(:,i,j)>=0.112)
%         time_ref=101;
%         difference=abs(time_signal(1)-101);
% 
%         deltaT=[deltaT difference];
%     end
% end
% 
% x=[1:30];
% y = deltaT/100;
% y1 = (-1/34.3).*x + 1.16;
% 
% p = polyfit(x, y, 1);
% f = polyval(p, x);
% 
% figure(4)
% hold on
% plot(x, y, '.b', x, f, 'b-')
% p(1)
% s = (-1/p(1))*10
% plot(x,y1,'-r')
% eqtxt = sprintf('experimental c = %.4fm/s', s);
% x1 = xlim;
% y1 = ylim;
% xt = 0.3 * (x1(2)-x1(1)+x1(1)); ...
% yt = 0.98 * (y1(2)-y1(1)+y1(1)); ...
% text(xt, yt, eqtxt, 'FontSize', 16, 'Color', 'r');
% legend({'Time Delay','Line of Best Fit','True Speed of Sound Slope'})
% grid on
% hold off


