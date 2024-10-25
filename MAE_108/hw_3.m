clear;clc;

%importing data
load('SD_temperature.dat')
load('SD_rainfall.dat')

%Starting vars
rain = SD_rainfall(:,2:end);

tem = SD_temperature(:,2:13);

figure(1)
bin_edges = fix(min(rain)):ceil(max(rain));
T = mean(rain);
histogram_P1 = histogram(rain,'BinWidth',0.1, 'Normalization','probability');
xlabel('rainfall (inches)')
ylabel('probability')
box on; grid on;
title('Probability of rainfall in San Diego From 1852 to 2020')

months = size(rain);
months = months(1,1) * months(1,2);

rainy = sum(rain>= 1, 'all');
cold = sum(tem <55, 'all');

P_C = cold/months;
P_R = rainy/months;

rainy_arr =  rain >= 1;
cold_arr = tem < 55;

rainy_cold = rainy_arr + cold_arr;

rainy_cold = rainy_cold == 2;

tot_rainy_cold = sum(rainy_cold, "all");

P_R_C= tot_rainy_cold/cold;
P_C_R = tot_rainy_cold/rainy;
