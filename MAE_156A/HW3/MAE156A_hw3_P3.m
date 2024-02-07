clear;
clc;
%% Compute the net moment from two moment diagrams

x = [0,0.5,1, 16, 16.5, 17, 30,30.5, 31, 39, 39.5, 41]; % locations of loading
Diam = [1,1, 1.3, 1.75, 2.5, 2.5, 1.75, 1.75, 1.3, 1.3, 1 ,1,]; % inches
F_y = [0,-208.51, 0,0,  300*cosd(20), 0,0, 183.12,0, 0 ,  -700*sind(20)  ,0]; % forces in y
F_z = [0,259.31, 0,0,  -300*sind(20), 0, 0,-861.48, 0 ,0,  700*cosd(20)  ,0]; % forces in z
T = [0,0, 0,0, -2819.08, 0, 0,0,0,0, 2819.08,0]; % torsion in shaft


S_UT = 64E3; % psi

%%%%%%%% an interpolation vector
x_interp = linspace(x(1), x(end), 1000);

Diam_interp = interp1(x, Diam, x_interp, 'previous');

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
%%%%%%%% Calculate alternating and mean stresses

sigma_a = 32*total_moment_interp ./ (pi * Diam_interp.^3);
sigma_m = 16*T_interp ./ (pi * Diam_interp.^3);

%%%%%%%% Calculate S_E and mean stresses

k_a = 2*(S_UT/1000)^(-0.217);       % hot rolle (equation takes in kpsi)
k_b = k_b_function(Diam_interp);           % D < 2 inches
k_c = 1;
k_d = 1;
k_e = 0.868;


S_e = k_a.*k_b.*k_c.*k_d.*k_e.*(0.5).*S_UT;

%%%%%%%% Calculate safety factor through shaft
figure(1)

SF = (sigma_a ./ S_e + sqrt(3)*sigma_m ./ S_UT).^(-1);
%subplot(3,1,3);
plot(x_interp, SF)
hold on
plot(x_interp, x_interp*0+1, 'k--')
axis([0, 41, -10, 40]);
xlabel('X position');
ylabel('Design safety factor');

%% functions
function out = k_b_function(Diam)
    out = Diam*0;
    for kk = 1:length(Diam)
        if Diam < 2
            out(kk) = (Diam(kk) / 0.3)^(-0.107);
        else
            out(kk) = 0.91*(Diam(kk))^(-0.157);
        end
    end
end
