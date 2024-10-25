clear;
clc;

%% Compute the net moment from two moment diagrams

x = [0.5, 0, 16.5, 0, 30.5, 0, 39.5,]; % locations of loading
Diam = [1, 1.3 1.75 2.5 1.75 1.3 1]; % inches
F_y = [-157.85, 243.95, 0, -81.6 ]; % forces in y
F_z = [101.54, -243.95, 318.75, -176.63]; % forces in z
T = [0, -2819.08, 0, 2819.08]; % torsion in shaft

Diam = 2.5; % inches
S_UT = 150E3; % psi

%%%%%%%% an interpolation vector
x_interp = linspace(x(1), x(end), 1000);

%%%%%%%% Construct the shear diagram
shear_y = cumsum(F_y);
shear_z = cumsum(F_z);

shear_y_interp = interp1(x, shear_y, x_interp, 'previous');
shear_z_interp = interp1(x, shear_z, x_interp, 'previous');

% figure(1)
% subplot(2,2,1);
% plot(x_interp, shear_y_interp,'LineWidth',2);
% axis([0, .85, -200, 200]);
% xlabel('X position');
% ylabel('XY shear');
% 
% subplot(2,2,2);
% plot(x_interp, shear_z_interp,'LineWidth',2);
% axis([0, .85, -200, 200]);
% xlabel('X position');
% ylabel('XZ shear');

%%%%%%%% Construct the moment diagram
moment_y_interp = cumtrapz(x_interp, shear_y_interp);
moment_z_interp = cumtrapz(x_interp, shear_z_interp);

figure(1)
subplot(1,2,1);
plot(x_interp, moment_y_interp, 'LineWidth',2);
axis([0, .85, -50, 0]);
xlabel('X position');
ylabel('Z moment');

subplot(1,2,2);
plot(x_interp, moment_z_interp,'LineWidth',2);
axis([0, .85, -40, 40]);
xlabel('X position');
ylabel('Y moment');


%%%%%%%% Construct the net torsion and net moment
total_moment_interp = sqrt(moment_y_interp.^2 + moment_z_interp.^2);

figure(2)
% subplot(2,1,1);
plot(x_interp, total_moment_interp)
xlabel('X position');
ylabel('Vector magnitude of moment');

figure(3)
 T_interp = interp1(x, T, x_interp, 'previous');
% subplot(2,1,2);
plot(x_interp, T_interp,'LineWidth',2)
% axis([0, 30, 0, 2000]);
xlabel('X position');
ylabel('Net Torsion');

%%%%%%%% Calculate alternating and mean stresses

sigma_a = 32*total_moment_interp ./ (pi * Diam.^3);
sigma_m = 16*T_interp ./ (pi * Diam.^3);

%%%%%%%% Calculate S_E and mean stresses

k_a = 11*(S_UT/1000)^(-0.65);       % hot rolle (equation takes in kpsi)
k_b = k_b_function(Diam);           % D < 2 inches
k_c = 1;
k_d = 1;
k_e = 1;


S_e = k_a*k_b*k_c*k_d*k_e*(0.5)*S_UT;

%%%%%%%% Calculate safety factor through shaft

SF = (sigma_a / S_e + sqrt(3)*sigma_m / S_UT).^(-1);

% figure(3)
% clf;
% subplot(3,1,1);
% plot(x_interp, total_moment_interp)
% xlabel('X position');
% ylabel('Vector magnitude of moment');

figure(3)
T_interp = interp1(x, T, x_interp, 'previous');
%subplot(3,1,2);
plot(x_interp, T_interp)
axis([0, 30, 0, 2000]);
xlabel('X position');
ylabel('Vector magnitude of moment');

subplot(3,1,3);
plot(x_interp, SF)
hold on
plot(x_interp, x_interp*0+1, 'k--')
axis([0, 30, 0, 10]);
xlabel('X position');
ylabel('Design safety factor');





%% functions
function out = k_b_function(Diam)
    if Diam < 2
        out = (Diam / 0.3)^(-0.107);
    else
        out = 0.91*(Diam)^(-0.157);
    end
    
end
