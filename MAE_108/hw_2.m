clear;clc;

%importing data
load('SD_temperature.dat')
year = SD_temperature(:,1);
tem = SD_temperature(:,2:13);
jan_tem = SD_temperature(:,2);
feb_tem = SD_temperature(:,3);
mar_tem = SD_temperature(:,4);
apr_tem = SD_temperature(:,5);
may_tem = SD_temperature(:,6);
jun_tem = SD_temperature(:,7);
jul_tem = SD_temperature(:,8);
aug_tem = SD_temperature(:,9);
sep_tem = SD_temperature(:,10);
oct_tem = SD_temperature(:,11);
nov_tem = SD_temperature(:,12);
dec_tem = SD_temperature(:,13);

figure(1)
bin_edges = fix(min(tem)):ceil(max(tem));
T = mean(tem);
histogram_P1 = histogram(tem,'BinWidth',1, 'Normalization','probability');
xlabel('temperature')
ylabel('probability')
box on; grid on;
title('Monthly Average Temperature in San Diego From 1852 to 2020')
M = length(jan_tem);
E_M = [(sum(jan_tem < 55))/M 
    (sum(feb_tem < 55))/M,
    (sum(mar_tem < 55))/M,
    (sum(apr_tem < 55))/M,
    (sum(may_tem < 55))/M,
    (sum(jun_tem < 55))/M,
    (sum(jul_tem < 55))/M,
    (sum(aug_tem < 55))/M,
    (sum(sep_tem < 55))/M,
    (sum(oct_tem < 55))/M,
    (sum(nov_tem < 55))/M,
    (sum(dec_tem < 55))/M];

figure(2)
bar(E_M)
title('Probability of Cold Event (T<55F) in Each Month')
box on; grid on;
xlabel('Month')
ylabel('Probability')
month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec',};
set(gca, 'XTickLabel',month)


E = sum(E_M.*(1/12));
M_E = (E_M.*(1/12))./E;

figure(3)
bar(M_E)
title('Given Cold Event (T<55F), Probability of Being in Each Month')
box on; grid on;
xlabel('Month')
ylabel('Probability')
month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec',};
set(gca, 'XTickLabel',month)

