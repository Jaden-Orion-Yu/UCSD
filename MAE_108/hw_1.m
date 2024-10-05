clear;clc;

%importing data
load('SD_temperature.dat')
year = SD_temperature(:,1);
tem = SD_temperature(:,2:end);
nov_tem = SD_temperature(:,11);

figure(1)
bin_edges = [fix(min(nov_tem)):ceil(max(nov_tem))];
histogram_P1 = histogram(nov_tem, 'BinEdges', bin_edges,'Normalization','count');
xlabel('temperature')
ylabel('number of months')
box on; grid on;
title('Histogram of Temperature in San Diego during November Months')
count_over_65 = sum(histogram_P1.Values(7:end));
P1_mean = mean(nov_tem);
prob_over_65 = 100*sum(nov_tem>=65)/length(nov_tem);
std_dev = std(nov_tem);
legend_input = append('Mean Temperature: ',num2str(P1_mean),newline,'Standard Deviation: ', ...
    num2str(std_dev),newline,'Probability of temperature being over 65: ',num2str(prob_over_65),'%');
legend(legend_input)




figure(2)
boxplot(tem)
grid on; box on;
xlabel('month')
ylabel('mean temperature (deg_C)')
month = {'J','F','M','A','M','J','J','A','S','O','N','D',};
set(gca, 'XTickLabel',month)
title('Annual Cycle of Temperature in San Diego')
iqr_2 = iqr(tem)

