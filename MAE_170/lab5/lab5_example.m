 clc
close all
%(time, x position, y position)

% recMatrix_sig(:,:,:)
 load('lab5_part2.mat');
%% TESTING AND VISUALS %%
% d1 = find(recMatrix_sig(:,i,j)>=0.2);
% d2 = find(recMatrix_ref(:,i,j)>=0.5);
% time_diff = abs(d1(1)-d2(1))/100;

% LAST PLOTS AND AVGS
% plot(1:598,wave_sig)
% plot(1:598,wave_ref)

% TESTING PLOTS AND SIGNAL
% AVERAGES
% figure(1)
% hold on
% plot(1:598,recMatrix_sig(:,1,2))
% plot(1:598,recMatrix_sig(:,i,j))

% plot(1:598,recMatrix_sig(:,22,14))

% plot(1:598,recMatrix_sig(:,1,14))

% SIGNAL
% plot(1:598,recMatrix_ref(:,1,2))
% plot(1:598,recMatrix_ref(:,i,j))

% plot(1:598,recMatrix_ref(:,1,14))

%% VALUE LOOP %% Q4
time_diff = zeros(30,15);
norm_dist = zeros(30,15);

%My Data
% for i = 1:30
%     for j = 1:15
%         d1 = find(recMatrix_sig(:,i,j)>=0.112);
%         d2 = find(recMatrix_ref(:,i,j)>=0.8);
%         if isempty(d2) == 1
%            d2 = find(recMatrix_ref(:,i,j)>=0.2);
%         end
%         time_diff(i,j) = abs(d1(1)-d2(1));
%         norm_dist(i,j) = sqrt(i^2 + j^2);
%     end
% end

% Capa's Data
for i = 1:30
    for j = 1:15
        d1 = find(recMatrix_sig(:,i,j)>=0.112);
        d2 = find(recMatrix_ref(:,i,j)>=0.8);
        if isempty(d2) == 1
           d2 = find(recMatrix_ref(:,i,j)>=0.2);
        end
        time_diff(i,j) = abs(d1(1)-d2(1));
        norm_dist(i,j) = sqrt(i^2 + j^2);
    end
end


%% TIME DELAY DEFINITION AND TWEAKING %% Q4
time_diff = zeros(30,15);
td_14fixed = time_diff(:,14);
% My Data
td_14fixed(4) = 104;
td_14fixed(6) = 100;
td_14fixed(7) = 91;
td_14fixed(11) = 91;
td_14fixed(12) = 87;
td_14fixed(16) = 76;
td_14fixed(17) = 75;
td_14fixed(19) = 71;
td_14fixed(22) = 62;

%Capa's Data
td_14fixed(2) = 89;
td_14fixed(3) = 85;
td_14fixed(5) = 82;
td_14fixed(11) = 69;
td_14fixed(13) = 63;
td_14fixed(15) = 55;
td_14fixed(16) = 56;
td_14fixed(17) = 54;
td_14fixed(19) = 50;
td_14fixed(22) = 45;
td_14fixed(25) = 42;
td_14fixed(26) = 39;
td_14fixed(29) = 30;
td_14fixed(30) = 29;


td_14fixed = flip(td_14fixed./100000);

hold on

figure(1)
v = (2:31)./100;
v_s = (2:.1:31)./100;
plot(v,td_14fixed,...
        'LineStyle','-','LineWidth',2,...
        'Marker','.','MarkerSize',15)

[p,S] = polyfit(v,td_14fixed,1);
p2 = polyval(p,v_s,S);
p2slope = (p2(2)-p2(1))/(v_s(2)-v_s(1));
exp_velocity = (p2slope)^(-1);
plot(v_s,p2,'LineWidth',2)


td_expected = v_s./343; %+ 3*10^-4;
plot(v_s,td_expected)
    
td_errpos = (ones(length(td_14fixed),1)./100000);
td_errneg = (ones(length(td_14fixed),1)./-100000);
v_errpos = (0.005)*ones(length(v),1);
v_errneg = (-0.005)*ones(length(v),1);

errorbar(v,td_14fixed,td_errneg,td_errpos,v_errneg,v_errpos,'b')

    axis([0 0.35 0 12*10^(-4)]) %3.5*10^(-4)
    legend('Measured Time Differences', 'Experimental Speed of Sound','Expected Speed of Sound')
    xlabel('Distance from Microphone (m)')
    ylabel('Time Delay (s)')


%% AVG TIME DIFF W/ ERROR %% NOT USED
% avg_time_diff = zeros(1,30);
% for i = 1:30
%     avg_time_diff(i) = mean(time_diff(i,:));
% end

% plot(1:30,td_14fixed,'Marker','.','LineStyle','-')

% [p,S] = polyfit(1:30,avg_time_diff,1);
% [p2,delta] = polyval(p,1:.1:30,S);
% plot(1:.1:30,p2)

% plot(1:.1:30,p2+2*delta, '--k',1:.1:30,p2-2*delta, '--k')

%% RESHAPING AND GRAPHS %% NOT USED
% norm_dist = reshape(round(norm_dist),[1,30*15]);
% time_diff = reshape(time_diff,[1,30*15]);

% plot(norm_dist,time_diff)
% plot([1:30*15],0.1*norm_dist)

% plot([1:30*15],time_diff)

%% COLOR GRAPH 1 %% Q6
figure(2)
pcolor(v,t,normalize(recMatrix_sig(:,:,14)))
c = colorbar;
set(c,'FontSize', 20);
shading interp

hold on;
p1 = plot(v, -v./343 + 1.16e-3,'r');

    xlabel('Distance from Microphone (m)')
    ylabel('Time(s)')
    legend(p1,{'Speed of Sound'})
%% COLOR GRAPH 2 %% Q7
figure(4)
y = (2:16)./100;
d7 = squeeze(recMatrix_sig(196,:,:));

pcolor(v,y,normalize(d7)')

c = colorbar;
set(c,'FontSize',20);
shading interp
hold on
xlabel('X Distance (m)')
ylabel('Y Distanec (m)')

%% GIF %% Q8

filename = 'scanning.gif';
t_pcolor = 100:1:350;
for k = t_pcolor

    figure(5)
    y = (2:16)./100;
    d7 = squeeze(recMatrix_sig(k,:,:));

    pcolor(v,y,normalize(d7)')

    c = colorbar;
    set(c,'FontSize',20);
    shading interp
    xlabel('X Distance (m)')
    ylabel('Y Distanec (m)')


    caxis([-1 1])
    pause(0.05);
    drawnow;

    h = figure(5);
    frame = getframe(h); 
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);

    % Write to the GIF File
    if k==1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end
%% TIME CALCULATION %% Q9
d8 = ((15*30)*4)/60
d9 = (d8*64)/60;

%32 Hours

%% Ratio %% Q10
%0.01/0.068 m
