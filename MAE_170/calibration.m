
clear all; clc; close all

%    True               Cycle
%   weight   1     2     3     4     5     6    
CD = [0.5,  nan, 0.20, 0.08, 0.17, 0.19, 0.11;
      1.0,  nan, 0.70, 0.78, 0.64, 0.61, 0.70;
      1.5,  nan, 1.18, 1.26, 1.25, 1.24, 1.23;
      2.0,  nan, 1.81, 1.93, 1.81, 1.93, 1.88;
      2.5, 2.62, 2.49, 2.46, 2.46, 2.58, 2.53;
      3.0, 3.15, 3.18, 3.24, 3.28, 3.13,  nan;
      3.5, 3.90, 3.84, 3.86, 3.97, 3.96,  nan;
      4.0, 4.59, 4.71, 4.61, 4.60, 4.60,  nan;
      4.5, 5.41, 5.35, 5.49, 5.46, 5.39,  nan;
      5.0, 6.24, 6.27, 6.10, 6.24, 6.16,  nan;
      4.5, 5.71, 5.74, 5.78, 5.84, 5.82,  nan;
      4.0, 4.96, 5.11, 5.08, 5.03, 5.03,  nan;
      3.5, 4.22, 4.34, 4.21, 4.22, 4.24,  nan;
      3.0, 3.57, 3.64, 3.66, 3.55, 3.67,  nan;
      2.5, 2.98, 2.86, 2.98, 2.98, 2.94,  nan;
      2.0, 2.22, 2.23, 2.26, 2.29, 2.26,  nan;
      1.5, 1.57, 1.70, 1.69, 1.63, 1.57,  nan;
      1.0, 1.07, 1.07, 1.11, 1.16, 1.11,  nan;
      0.5, 0.52, 0.61, 0.61, 0.61, 0.45,  nan;
      0.0, 0.02, 0.08, 0.08,-0.03, 0.06,  nan];

num_rows = size(CD,1);
num_weights = num_rows/2+1;
num_cycles = size(CD,2)-1;

%Plot calibration data
figure(1)
hold on
X = CD(:,1);
Y = CD(:,2:end);
scatter(X,Y,'bx')
grid on
xlabel('True weight (lb)')
ylabel('Scale reading (lb)')
title('Calibration data & corralating function')

%Fit calibration curve (linear) / determine correlating function 
x = repmat(X,1,6);
x = x(:);
y = Y(:);
x = x(~isnan(y));
y = y(~isnan(y));
P = polyfit(x,y,1);
yc = @(x) P(1)*x+P(2);
plot(x,yc(x),'-','LineWidth',2,'Color',[1, 0, 0, 0.1])
q{1} = plot(nan, 'bx'); q{2} = plot(nan, 'r-', 'LineWidth',2);
legend([q{:}], {'Measurements','Linear fit'},'Location', 'best')

%Calculate deviation data
DD = CD;
for i = 1:num_rows
    DD(i,2:num_cycles+1) = CD(i,2:num_cycles+1) - yc(CD(i,1));
end

%Detremine averages over cycles for upscale and downscale measurements seperately
for i = 1:num_rows
    readings = DD(i,2:num_cycles+1)';
    DD(i,num_cycles+2) = mean(readings(~isnan(readings)));
end

%Detremine averages over cycles with upscale and downscale measurements combined
weights(1) = 0; %lb
weights(2:num_weights) = DD(1:num_weights-1,1);
average_combined = zeros(1,num_weights);
for i = 1:num_weights
    ind = DD(:,1) == weights(i);
    submat = DD(ind,2:num_cycles+1);
    average_combined(i) = mean(submat(~isnan(submat)));
end

%Plot deviation data
figure(2)
hold on
X = DD(:,1);
Y = DD(:,2:num_cycles+1);
scatter(X,Y,'bx')
line([weights(1), weights(end)], [max(Y(:)), max(Y(:))], 'Color', [0, 0.0, 1, 0.4], 'LineWidth', 1.5)
line([weights(1), weights(end)], [min(Y(:)), min(Y(:))], 'Color', [0, 0.0, 1, 0.4], 'LineWidth', 1.5)
grid on
xlabel('True weight (lb)')
ylabel('Deviation (lb)')
title('Calibration data & corralating function')
axis([0 5 -0.5 0.6])

%Determine accuracy limits
accuracy_limits = [min(Y(:)),max(Y(:))];
fprintf('Accuracy limts = (%.2f, %.2f) lb\n', accuracy_limits(1), accuracy_limits(2))

%Plot deviation data averaged over cycles
figure(3)
hold on
X = DD(:,1);
Y = DD(:,num_cycles+2);
scatter(X,Y,'bsq')
scatter(weights,average_combined,'bo','MarkerFaceColor', 'b')
grid on
xlabel('True weight (lb)')
ylabel('Average deviation (lb)')
title('Calibration data & corralating function')

%Determine output span
span = max(y)-min(y);

%Determine sensitivity error (at 95% confidence level)
n = length(y);
Syx = sqrt(1/(n-2) * sum((yc(x)-y).^2));
conf_level = 0.95;
alpha = 1-conf_level;
t = tinv(1-alpha/2, n-1); %Student's t-value for 95% confidence level
xmean = mean(x);
sensitivity_error = t*Syx*sqrt(1./sum((x-xmean).^2))*span; %slope uncertainty times span (max sensitivity error)
fprintf('Sensitivity error = %.2f lb\n', sensitivity_error)

%Determine zero offset error (uncertainty in intercept at 95% confidence level)
zero_offset_error = t*Syx*sqrt(sum(x.^2)./(n*sum((x-xmean).^2))); %intercept uncertainty
fprintf('Zero-offset error = %.2f lb\n', zero_offset_error)

%Determine hysteresis error
maximum_maximorum = 0;
for i = 1:num_cycles
    maximum = 0;
    i;
    for j = 1:num_weights-2 %skipping weights of 0 lb and 5 lb (as these do not repeat)
        ind = find(CD(:,1) == CD(j,1));
        diff = abs(CD(ind(1),i+1) - CD(ind(2),i+1));
        if diff > maximum
            maximum = diff;
        end
    end
    if maximum > maximum_maximorum
        maximum_maximorum = maximum;
    end
end
hysterisis_error = maximum_maximorum;
fprintf('Hysterisis error = %.2f lb\n', hysterisis_error)

%Determine repeatability error
max_repeatability_error = 0;
for i = 1:num_rows
    repeat_error = abs(CD(i,2:num_cycles+1) - CD(i,2:num_cycles+1)');
    repeat_error = max(repeat_error(:));
    if max_repeatability_error < repeat_error
        max_repeatability_error = repeat_error;
    end
end
fprintf('Max repeatability error = %.2f lb\n', max_repeatability_error)

%Determine random error
random_error = zeros(1,num_rows);
for i = 1:num_rows 
    readings = CD(i,2:num_cycles+1);
    readings = readings(~isnan(readings));
    t = tinv(1-alpha/2, length(readings)-1); %Student's t-value for 95% confidence level
    random_error(i) = t*std(readings);
end
max_random_error = max(random_error);
fprintf('Max random error = %.2f lb\n', max_random_error)

%Determine linearity error (terminal linearity error)
y1 = average_combined(1); y2 = average_combined(end);
x1 = weights(1); x2 = weights(end);
m = (y2-y1)/(x2-x1);
b = y2 - m*x2;
terminal_line = @(x) m*x + b;
figure(3)
fplot(terminal_line, [x1, x2], 'Color', [0, 0, 1], 'LineWidth', 1.5);
[linearity_error, ind] = max(abs(average_combined - terminal_line(weights)));
line([weights(ind), weights(ind)],[terminal_line(weights(ind)), average_combined(ind)], 'Color', 'r')
axis([0 5 -0.4 0.6])
q{1} = plot(nan, 'bsq'); q{2} = plot(nan, 'bo', 'MarkerFaceColor','b'); q{3} = plot(nan, 'b-'); q{4} = plot(nan, 'r-');
legend([q{:}], {'Upscale & downscale seperately','Upscale & downscale combined','Terminal line', 'Linearity error'}, 'Location', 'best')
fprintf('Linearity error = %.2f lb\n', linearity_error)












