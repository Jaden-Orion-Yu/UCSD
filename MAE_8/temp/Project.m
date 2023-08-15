clear all; close all; clc; format long; 
name = 'Jonathan Lie';
id = 'A16838747';
hw_num = 'Project';
%% Task 1
% Given Variables:
M = 5.97*10^24; % Mass of Earth
G = 6.67408*10^(-11); % Gravitational Constant
m = 250; % Mass of Satellite
A = 0.25; % Projected Area of Satellite
p = 5.5*10^(-12); % Air Density 
C = 2.2; % Drag Coefficient
% Satellite Data
Data = importdata('satellite_data.txt');
% Graph
p1a = evalc('help satellite');
p1b = 'See figure 1';
R = 6.37e6;
load('earth_topo.mat'); 
figure(1);
[x,y,z] = sphere(50);
s = surf(R*x/1e6,R*y/1e6,R*z/1e6); % create a sphere
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  % IMPORTANT: axis unit is in 10^6 m
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('Earth');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:2:6,'Ytick',-6:2:6,'Ztick',-6:2:6);
hold on;
[T, X, Y, Z, U, V, W] = satellite (Data.data(1,2), Data.data(1,3), Data.data(1,4), Data.data(1,5), Data.data(1,6), Data.data(1,7), 5000);
plot3(X./1e6,Y./1e6,Z./1e6, 'LineWidth',2, 'Color','k')
plot3(X(end)/1e6, Y(end)/1e6, Z(end)/1e6, 'ko', 'MarkerFaceColor','k')

%% Task 2
figure(2);
for n = 1:6
    [Xo,Yo,Zo,Uo,Vo,Wo] = read_input('satellite_data.txt',n);
    [T,X,Y,Z,U,V,W] = satellite(Xo,Yo,Zo,Uo,Vo,Wo, 12400);
    h = sqrt((X.^2)+(Y.^2)+(Z.^2)) - R;
    Vmag = sqrt((U.^2)+(V.^2)+(W.^2));
    count = 1;
    for j = 2:length(h)-1
        if ((h(j) - h(j-1))>0) && ((h(j) - h(j+1))>0)
            locMaxTimes(count) = T(j);
            count = count+1;
        end
    end

    stat(n) = struct('sat_id',n,'final_position', [X(end),Y(end),Z(end)],'final_velocity',[U(end),V(end),W(end)], 'time_lmax_altitude', locMaxTimes,'travel_distance',sum(sqrt((diff(X).^2)+(diff(Y).^2) + (diff(Z).^2))),'orbital_period',(locMaxTimes(2)-locMaxTimes(1)));
    color = '';
    switch n
        case 1
            color = 'k-';
        case 2
            color = 'r-';
        case 3
            color = 'b-';
        case 4 
            color = 'g-';
        case 5
            color = 'c-';
        case 6
            color = 'm-';
    end
    hold on;
    subplot(2,1,1)
    plot(T, h,color,'LineWidth',1)
    hold off;
    hold on;
    subplot(2,1,2)
    plot(T, Vmag,color,'LineWidth',1)
    hold off;
end

hold on;
subplot(2,1,1)
xlabel('Time (s)');
ylabel('Altitude (m)');
legend('ID: 0001','ID: 0002','ID: 0003','ID: 0004','ID: 0005','ID: 0006');
title('(a) Altitude vs Time of first 6 satellites');
hold off;

hold on;
subplot(2,1,2)
xlabel('Time (s)');
ylabel('Speed (m/s)');
legend('ID: 0001','ID: 0002','ID: 0003','ID: 0004','ID: 0005','ID: 0006');
title('(b) Speed vs Time of first 6 satellites');
hold off;
%% Text File on Task 2
fid = fopen('report.txt', 'w');
fprintf(fid, '%s\n%s\n', name, id);
fprintf(fid, 'Satellite_ID, travel_distance(m), orbital_period(s)\n');
for n = 1:6
    fprintf(fid, '%d, %15.9e, %15.9e\n', ...
        n, stat(n).travel_distance, stat(n).orbital_period);
end
fclose(fid);
p2a =evalc('help read_input'); p2b ='See figure 2';
p2c = stat(1); p2d = stat(2); p2e = stat(3);
p2f = stat(4); p2g = stat(5); p2h = stat(6);
p2i = evalc('type report.txt');
%% Task 3
p3a = 'See figure 3';
p3b = 'Satellites move fastest when they are closest to the Earth';
p3c = 'As satellites travel further away from Earth their velocity decreases';
load('earth_topo.mat'); 
figure(3);
hold on;
subplot(1,2,1)
[~,~,~] = sphere(50);
s = surf(R*x/1e6,R*y/1e6,R*z/1e6); % create a sphere
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  % IMPORTANT: axis unit is in 10^6 m
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('All Satellites at time = 0 s');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:4:6,'Ytick',-6:4:6,'Ztick',-6:4:6);
hold off
hold on;
subplot(1,2,2)
[x,y,z] = sphere(50);
s = surf(R*x/1e6,R*y/1e6,R*z/1e6); % create a sphere
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  % IMPORTANT: axis unit is in 10^6 m
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('All Satellites at time = 6000 s');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:4:6,'Ytick',-6:4:6,'Ztick',-6:4:6);
hold off;
for n = 1:520
    [Xo,Yo,Zo,Uo,Vo,Wo] = read_input('satellite_data.txt',n);
    [T,X,Y,Z,U,V,W] = satellite(Xo,Yo,Zo,Uo,Vo,Wo, 6000);

    if (X(1) - (-5.5E6)) <= 2E6 && (Y(1) - (-3.9E6)) <= 2E6 && Z(1) <= 1.7E6 && Z(1) >= -1.5E6
        hold on;
        subplot(1,2,1)
        plot3(X(1)/1e6,Y(1)/1e6,Z(1)/1e6, 'bo', 'MarkerFaceColor','b', MarkerSize=10)
        hold off;
        hold on;
        subplot(1,2,2)
        plot3(X(end)/1e6,Y(end)/1e6,Z(end)/1e6, 'bo', 'MarkerFaceColor','b', MarkerSize=10)
        hold off
    else
        hold on;
        subplot(1,2,1)
        plot3(X(1)/1e6,Y(1)/1e6,Z(1)/1e6, 'mo', 'MarkerFaceColor','m', MarkerSize=5)
        hold off;
        hold on;
        subplot(1,2,2)
        plot3(X(end)/1e6,Y(end)/1e6,Z(end)/1e6, 'mo', 'MarkerFaceColor','m', MarkerSize=5)
        hold off;
    end
end
