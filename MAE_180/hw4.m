clear;clc;

%% problem 1
%time units in s, degree units in radians, distance units in km
R_eci =[9000;-5000;4000];
dt = 3600;
geodLat = 0.57;
geodLon = 4.24;
etildesqrd = 0.00669438;
we = 7.292115816*(10^-5);
a = 6378.14;

theta = we*(dt);
R_ef = G3(R_eci,theta);

Rg_ef = (a/sqrt(1-(etildesqrd*sin(geodLat))^2)).*[cos(geodLat)*cos(geodLon);cos(geodLat)*sin(geodLon);(1-etildesqrd)*sin(geodLat)];

P = [0,1,0;0,0,1;1,0,0];
R_enu = P*G2(G3((R_ef - Rg_ef),geodLon),-geodLat);
disp(R_enu)


%% problem 2
%plot geocentric lat (-90<x<90) vs lon (0<x<360)
we = 7.292115816*(10^-5);
a = 9000;
e = 0.25;
i = pi/6;
omega = pi/3;
w = pi/4;
%timestep over 1 siderial day starting from 3AM
%timestep = linspace(0,86164.91,1000);
n = sqrt(396800/(a^3));
T = 2*pi/n;
timestep = linspace(0,T,1000);
M = n.*timestep;
lat = zeros(1,length(timestep));
lon = zeros(1,length(timestep));
for k = 1:1:length(timestep)
    temp = ecc2ecctrueanom(e,M(k));
    Et = temp(1);
    Nut = temp(2);
    R = (a*(1-e^2))/(1+e*cos(Nut));
    Rperi = [R*cos(Nut);R*sin(Nut);0]; 
    Reci = peri2eci(Rperi,w,i,omega);
    Ref = G3(Reci,we*timestep(k));
    x = Ref(1);
    y = Ref(2);
    z = Ref(3);
    u = sqrt(x^2+ y^2);
    lat(k) = rad2deg(atan2(z,u));
    lon(k) = rad2deg(atan2(y,x));
    % lat(k) = rad2deg(atan(z/u)) ;
    % lon(k) = rad2deg(atan(y/x));
end
for t = 1:1:length(lat)
    lon(t) = lon(t) - 180;
end

figure(1)
plot(-lon,-lat,'.')
xlabel('Geocentric longitude (deg)')
ylabel('Geocentric latitude (deg)')
ylim([-90,90])
xlim([0,360])
grid on;
title('Geodatic Latitude vs Longitude over 1 period')




%% functions
function R = G3(r,theta)
    G3 = [cos(theta), sin(theta), 0;-sin(theta), cos(theta), 0; 0,0,1];
    R = G3*r;
end

function R = G2(r,theta)
    G2 = [cos(theta),0,-sin(theta);0,1,0;sin(theta),0,cos(theta)];
    R = G2*r;
end

function R  = eci2peri(r,w,i,omega)
    Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
    Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
    Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];
    R = Gw*Gi*Gomega*r;
end

function R  = peri2eci(r,w,i,omega)
    Gomega = [cos(omega), sin(omega), 0;-sin(omega), cos(omega), 0; 0,0,1]; 
    Gi = [1,0,0;0,cos(i), sin(i);0,-sin(i), cos(i)];
    Gw = [cos(w), sin(w), 0;-sin(w), cos(w), 0; 0,0,1];
    R = (Gomega')*(Gi')*(Gw')*r;
end

function out = ecc2ecctrueanom(e,M) 
     E = M;
     acc = 1e-9;  
     diff = 1;   
     while abs(diff) > acc
        diff = E-e*sin(E)-M;
        E = E-diff/(1-e*cos(E));  
     end
     Nu = 2 * atan2(sqrt(1+e)*sin(E/2), sqrt(1-e)*cos(E/2));
     out = [E,Nu];
end
