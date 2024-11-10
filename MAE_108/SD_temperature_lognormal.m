clear; close all; clc

%% Load and extract data
load('SD_temperature.dat');     
year = SD_temperature(:,1);
month = 1:12;
T = SD_temperature(:,2:end);    %matrix: 169 rows by 12 column (month)


%% Obtain lognormal parameters:
% lambda = ...
% zeta = ...

%% Contruct model PDF, CDF and 10th percentile
x = 45:0.1:80;                  % rannge of temperature used in the model

% for n = 1:12
%     model_pdf(n,:) = lognpdf( ... );
%     model_cdf(n,:) = logncdf( ... );
%     fiveth_percentile(n) = logninv( ... );
%     ninetyfiveth_percentile(n) = logninv( ... );
% end

%% Plot PDF
% figure(1); hold on;
% pcolor(month, x, model_pdf'); shading flat;
% plot(month, fiveth_percentile, 'w', 'LineWidth', 2);
% plot(month, ninetyfiveth_percentile, 'w', 'LineWidth', 2);
% xlabel('month'); ylabel('temperature (F)'); axis tight;
% title({'Annual cycle of temperature in San Diego',...
%      'PDF using lognormal model distribution'}); 
% colormap('jet'); colorbar;
% set(gca,'XTick',1:12,'XTickLabel',{'J','F','M','A','M','J','J','A','S','O','N','D'})

%% Plot CDF
% figure(2); hold on;
% pcolor(1:12, x, model_cdf'); shading flat;
% plot(month, fiveth_percentile, 'w', 'LineWidth', 2);
% plot(month, ninetyfiveth_percentile, 'w', 'LineWidth', 2);
% xlabel('month'); ylabel('temperature (F)'); axis tight;
% title({'Annual cycle of temperature in San Diego',...
%      'PDF using lognormal model distribution'}); 
% colormap('jet'); colorbar;
% set(gca,'XTick',1:12,'XTickLabel',{'J','F','M','A','M','J','J','A','S','O','N','D'});

