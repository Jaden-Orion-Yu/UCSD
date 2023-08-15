clear; clc; close all;

%% display description
disp('this programm accesses rainfall data in san diego from 1850 -2021')

%% request user input
year = input('Enter a year (1850-2021): ');
start_month = input('Enter a start month (1-12):');
end_month = input('Enter an end month (1-12): ');
export_filename = input('Enter a file name to export: ', 's');

%% Load and jextract rainfall data
load('rainfall.dat');

row_id = find(rainfall(:,1) == year);
rain_data = rainfall(row_id , start_month+1 :end_month+1);


%% make figure

figure(1); hold on;
month = start_month:end_month;
bar(month,rain_data, 'r');
plot(month,rain_data,'b-o', 'MarkerFaceColor', 'b', 'MarkerSize', 10, 'LineWidth' , 3)
xlabel('month');
ylabel('rainfall (in.)');
title_string = sprintf('rainfall in san diego in %4d', year);
title(title_string);
box on; grid on;
set(gca, 'FontSize', 16);




%% export data to external file
our_data = [month' rain_data'];
save(export_filename, 'our_data','-ascii');

