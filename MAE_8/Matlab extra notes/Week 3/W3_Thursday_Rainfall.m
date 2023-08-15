
%% WRITING ACCESS RAINFALL PROGRAM

clear; clc; close all;

format compact;

%% display description

disp('This program accesses rainfall data in San Diego from 1850-2021');

%% request user's inputs

year = input('What year between 1850 and 2021? ');
start_month_string = sprintf('What starting month in %4i? ', year);
start_month = input(start_month_string);
end_month_string = sprintf('What ending month in %4i? (Your first month is %i.) ', year, start_month);
end_month = input(end_month_string);
filename = input('What do you want to name the file export? ','s');

%% load and extract rainfall data

load('rainfall.dat');

row_id = find(rainfall(:,1) == year);
col_id = (start_month+1:end_month+1);
rain_data = rainfall(row_id, col_id);

%% make figure

figure(1); hold on;

month = start_month:end_month;
bar(month, rain_data, 'r');
plot(month, rain_data, 'b-o', 'MarkerFaceColor', 'b', 'MarkerSize', 10, 'LineWidth', 3);
box on; grid on;
set(gca, 'FontSize', 16);
xlabel('month');
ylabel('rainfall (in.)');
title_string = sprintf('Rainfall in San Diego in %4i from month %i to %i', year, start_month, end_month); % you need to pass through an sprintf in order to put variables into title
title(title_string);


%% export data to external file

out_data = [month' rain_data']; % creates a matrix of data input; month and corresponding rainfall. Must be transposed in order to work together
save(filename, 'out_data', '-ascii');
