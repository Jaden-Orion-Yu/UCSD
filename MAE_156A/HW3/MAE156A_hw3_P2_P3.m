clear;
clc;

%% 

x = [0, 16, 30, 39]; % locations of loading
F_y = [-157.73, 300*cosd(20), 183.12, 750*sind(20) ]; % forces in y
F_z = [259.31, -300*sind(20), -861.48, 750*cosd(20)]; % forces in z
T = [0, -2819.08, 0, 2819.08]; % torsion in shaft

S_UT = 64000; % psi

%%%%%%%% an interpolation vector
x_interp = linspace(x(1), x(end), 1000);

%%%%%%%% Construct the shear diagram
shear_y = cumsum(F_y);
shear_z = cumsum(F_z);

shear_y_interp = interp1(x, shear_y, x_interp, 'previous');
shear_z_interp = interp1(x, shear_z, x_interp, 'previous');

%%%%%%%% Construct the moment diagram
moment_y_interp = cumtrapz(x_interp, shear_y_interp);
moment_z_interp = cumtrapz(x_interp, shear_z_interp);

%%%%%%%% Construct the net torsion and net moment
total_moment_interp = sqrt(moment_y_interp.^2 + moment_z_interp.^2);
T_interp = interp1(x, T, x_interp, 'previous');

%% Part C
figure(1)
subplot(2,1,1);
plot(x_interp, moment_y_interp);
%axis([0, 39, 0, 5000]);
xlabel('X position (in)');
ylabel('Z moment (lbf-in)');

subplot(2,1,2);
plot(x_interp, moment_z_interp);
%axis([0, 39 -9000, 0]);
xlabel('X position (in)');
ylabel('Y moment (lbf-in)');


%% Part D
figure(2)
plot(x_interp, total_moment_interp)
xlabel('X position (in)');
ylabel('Vector magnitude of moment (lbf-in)');

momentMax = max(total_moment_interp);

%% Part E
figure(3)
plot(x_interp, T_interp,'LineWidth',2)
% axis([0, 30, 0, 2000]);
xlabel('X position (in)');
ylabel('Net Torsion (lbf-in)');

%% problem 3B
Diam = [1.5, 1.75 2.25 1.75 1.5 1.5];


sigma_a = 32*total_moment_interp ./ (pi * Diam.^3);
sigma_m = 16*T_interp ./ (pi * Diam.^3);


%%%%%%%% Calculate S_E and mean stresses

k_a = 2*(S_UT/1000)^(-0.217);       % Cold rolled PSI
k_b = k_b_function(Diam);           % D < 2 inches
k_c = 1;
k_d = 1;
k_e = 0.868;


%% helper
function out = k_b_function(Diam)
    if Diam < 2
        out = (Diam / 0.3)^(-0.107);
    else
        out = 0.91*(Diam)^(-0.157);
    end
    
end

