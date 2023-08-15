clear all; 
close all; 
clc;         
format long; 

name = 'Jaden McDonald Peltier Yu';
id = 'A15960227';
hw_num = 'project';

tic
%% task 1
Re = 6.37e6;
load('earth_topo.mat'); 
figure(1);
[x,y,z] = sphere(50);
s = surf(Re*x/1e6,Re*y/1e6,Re*z/1e6); % create a sphere
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  % IMPORTANT: axis unit is in 10^6 m
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('Earth');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:4:6,'Ytick',-6:4:6,'Ztick',-6:4:6);
hold on;
[Xo,Yo,Zo,Uo,Vo,Wo] = read_input('satellite_data.txt',001);
[T,X,Y,Z,U,V,W] = satellite(Xo,Yo,Zo,Uo,Vo,Wo, 5000);

plot3(X./1e6,Y./1e6,Z./1e6, 'k-', 'LineWidth',2)
plot3(X(end)/1e6,Y(end)/1e6,Z(end)/1e6, 'ko','MarkerFaceColor','k')
plot3(X(1)/1e6,Y(1)/1e6,Z(1)/1e6, 'ko','MarkerFaceColor','k')

hold off;


p1a = evalc('help satellite');
p1b = 'See figure 1';

%% Task 2
figure(2);

for n = 1:6
    [Xo,Yo,Zo,Uo,Vo,Wo] = read_input('satellite_data.txt',n);
    [T,X,Y,Z,U,V,W] = satellite(Xo,Yo,Zo,Uo,Vo,Wo, 12400);
    h = sqrt((X.^2)+(Y.^2)+(Z.^2)) - Re;
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
            color = 'r-';
        case 2
            color = 'k-';
        case 3
            color = 'b-';
        case 4 
            color = 'y-';
        case 5
            color = 'g-';
        case 6
            color = 'm-';
    end
    hold on;
    subplot(2,1,1)
    plot(T, h,color)
    hold off;
    hold on;
    subplot(2,1,2)
    plot(T, Vmag,color)
    hold off;
    
end

hold on;
subplot(2,1,1)
xlabel('Time (s)');
ylabel('Altitude (m)');
legend('ID 001','ID 002','ID 003','ID 004','ID 005','ID 006');
title('Satellite Altitude (m) vs Time (s)');
hold off;

hold on;
subplot(2,1,2)
xlabel('Time (s)');
ylabel('Velocity Magnitude (m/s)');
legend('ID 001','ID 002','ID 003','ID 004','ID 005','ID 006');
title('Satellite Velocity Magnitude (m/s) vs Time (s)');
hold off;

%text file doesn't save right
% save("report.txt", 'text','-ascii');
filesave = fopen('report.txt', 'w');
fprintf(filesave, '%s\n%s\n', name, id);
fprintf(filesave, 'Satellite_ID, travel_distance(m), orbital_period(s)\n');
for n = 1:6
    fprintf(filesave, '%d,         %15.9e,      %15.9e\n', ...
        n, stat(n).travel_distance, stat(n).orbital_period);
end

p2a =evalc('help read_input'); p2b ='See figure 2';
p2c = stat(1); p2d = stat(2); p2e = stat(3);
p2f = stat(4); p2g = stat(5); p2h = stat(6);
p2i = evalc('type report.txt');


%% task 3

load('earth_topo.mat'); 
figure(3);
hold on;
subplot(1,2,1)
[x,y,z] = sphere(50);
s = surf(Re*x/1e6,Re*y/1e6,Re*z/1e6); % create a sphere
s.CData = topo;                % set color data to topographic data
s.FaceColor = 'texturemap';    % use texture mapping
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  % IMPORTANT: axis unit is in 10^6 m
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('Earth');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:4:6,'Ytick',-6:4:6,'Ztick',-6:4:6);
hold off
hold on;
subplot(1,2,2)
[x,y,z] = sphere(50);
s = surf(Re*x/1e6,Re*y/1e6,Re*z/1e6); 
s.CData = topo;                
s.FaceColor = 'texturemap';    
s.EdgeColor = 'none';          
s.FaceLighting = 'gouraud';    
s.SpecularStrength = 0.4;      
grid on; box on; axis equal;
axis(7*[-1 1 -1 1 -1 1]);  
xlabel('x (10^6 m)'); ylabel('y (10^6 m)'); zlabel('z (10^6 m)'); title('Earth');
set(gca,'LineWidth',1,'FontSize',14, ...
        'Xtick',-6:4:6,'Ytick',-6:4:6,'Ztick',-6:4:6);
hold off;
for n = 1:520
    [Xo,Yo,Zo,Uo,Vo,Wo] = read_input('satellite_data.txt',n);
    [T,X,Y,Z,U,V,W] = satellite(Xo,Yo,Zo,Uo,Vo,Wo, 6000);
    
    xcoord = (-5.5e6);
    ycoord = (-3.9e6);
    zcoord = (0);


    if sqrt((X(1)-xcoord)^2 +(Y(1)-ycoord)^2 + (Z(1)-zcoord)^2 ) < (2000000)
        hold on;
        subplot(1,2,1)
        plot3(X(1)/1e6,Y(1)/1e6,Z(1)/1e6, 'bo', 'MarkerFaceColor','b', 'MarkerSize',5)
        hold off;
        hold on;
        subplot(1,2,2)
        plot3(X(end)/1e6,Y(end)/1e6,Z(end)/1e6, 'bo', 'MarkerFaceColor','b', 'MarkerSize',5)
        hold off
    else
        hold on;
        subplot(1,2,1)
        plot3(X(1)/1e6,Y(1)/1e6,Z(1)/1e6, 'mo', 'MarkerFaceColor','m', 'MarkerSize',5)
        hold off;
        hold on;
        subplot(1,2,2)
        plot3(X(end)/1e6,Y(end)/1e6,Z(end)/1e6, 'mo', 'MarkerFaceColor','m', 'MarkerSize',5)
        hold off;
    end
    subplot(1,2,1)
    title("Satellite initial position")
    subplot(1,2,2)
    title("Satellite final position")
p3a = 'See figure 3';
p3b = 'the satellites move fastest when they are closer to earth';
p3c = 'as the satellites mover further away from earth their speed decreases';
    
end

toc