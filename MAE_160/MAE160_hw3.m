clear;
clc;

%% Problem3
% time in min
t3 = [0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30];
strain3 = [0.00 0.025 0.043 0.065 0.078 0.092 0.109 0.120 0.135 0.153 0.172 0.193 0.218 0.255 0.307 0.368];
dt3 = 2;
dstrain3 = zeros(1,length(strain3));

for i = 2:length(strain3)
   dstrain3(i) = strain3(i) - strain3(i-1);
end

figure(1)
plot(t3, strain3, '-r')
xlabel('time')
ylabel('strain')
hold on
plot(t3, dstrain3./dt3,'-b')
legend('strain','change in strain')
grid on;

%% Problem 6

%temp is in C 
hlg_T = [400 600 800 1000];
hlg_vis = [10^14 31622776.6 31622.7766 1000];

slg_T = [600 800 1000 1200 1400 1600];
slg_vis = [10^11 3162277.66 31622.7766 3162.27766 501.1872336 125.8925412];

fs_T = [1200 1400 1600];
fs_vis = [(3.16228*10^12) 10000000000 125892541.2];


%conversions


figure(2)
subplot(3,1,1)
plot((hlg_T + 273.13).^-1, log(hlg_vis),'-r')
xlabel('1/T (1/K)')
ylabel('ln(vis)')
title('High-Lead glass')
subplot(3,1,2)
plot((slg_T + 273.13).^-1, log(slg_vis),'-r')
xlabel('1/T (1/K)')
ylabel('ln(vis)')
title('Soda Lime glass')
subplot(3,1,3);
plot((fs_T + 273.13).^-1, log(fs_vis),'-r')
xlabel('1/T (1/K)')
ylabel('ln(vis)')
title('Fused Silica')