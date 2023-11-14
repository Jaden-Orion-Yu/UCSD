clear;clc;

DK = @(k) sqrt((((100./(k.*pi)).*(2*cos(2.*pi.*k./3) - 1) + (300./(k.^2 .* pi.^2)).*sin(2.*k.*pi./3))).^2);
%func = @(k,t) dk(k).*cosd((k.*rad2deg(pi).*t./3) - 90);
K1 = 1:6;
D1 = DK(K1);

K2 = 100;

t = 0:0.001:6;

F = func(t,K2)

    

plot(t,F)

function Y = func(t,k)
    Y = zeros(1,numel(t));
    Y = 1/2;
    for i = 1 : k
        d = sqrt((((100./(i.*pi)).*(2*cos(2.*pi.*i./3) - 1) + (300./(i.^2 .* pi.^2)).*sin(2.*i.*pi./3))).^2);
        Y = Y+ d.*cos((i.*(pi/3).*t) - pi/2);
    end
end