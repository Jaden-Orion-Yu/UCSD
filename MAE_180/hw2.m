clear;clc;

%% problem 1

%using newtonian method listed in the notes on oct 15th

Mt = 5.3454975;
E = Mt;
e = 0.5;
%check = ((E-e*sin(E)) - Mt) >= 0.00000000001;
Ek = E;
count = 0;
%while check
for c = 1:100
    Ek_plus = Ek - ((Ek - e*sin(Ek) - Mt)/(1-e*cos(Ek)));
    %check = ((Ek_plus-e*sin(Ek_plus)) - Mt) >= 0.00000000001;
    Ek = Ek_plus;
    count = count +1;
end

%% problem 2

M_space = linspace(0,2*pi,100);
e1 = 0.1;
e2 = 0.5;


for i = 1:length(M_space)
    Tecctrue1 = ecc2ecctrueanom(e1,M_space(i));
    Tecctrue2 = ecc2ecctrueanom(e2,M_space(i));
    ecc1(i) = Tecctrue1(1);
    true1(i) = Tecctrue1(2);
    ecc2(i) = Tecctrue2(1);
    true2(i) = Tecctrue2(2);
end

figure(1)
plot(ecc1, M_space, 'r*',true1,M_space,'bo')
xlabel('Mean Anomlay (rads)')
ylabel('Eccentric and True anomaly (rads)')
legend('Eccentric anomlay','True anomaly')
grid on;
title('Eccentric and True anomaly for e = 0.1 and 0<=M<=2Pi')
figure(2)
plot(ecc2, M_space, 'r*',true2,M_space,'bo')
xlabel('Mean Anomlay (rads)')
ylabel('Eccentric and True anomaly (rads)')
legend('Eccentric anomlay','True anomaly')
title('Eccentric and True anomaly for e = 0.5 and 0<=M<=2Pi')
grid on;

%% functions

function out = ecc2ecctrueanom(e,M) 
     Ek = M;
     for c = 1:100
        Ek_plus = Ek - ((Ek - e.*sin(Ek) - M)/(1-e.*cos(Ek)));
        Ek = Ek_plus;
     end
     E = Ek;
     Nu = 2.*atan(sqrt((1+e)./1-e).*tan(E./2));
     out = [E,Nu];
end

