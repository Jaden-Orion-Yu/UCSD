


%% Compute the net moment from two moment diagrams

x = [0, 1, 2, 7.75, 8.75, 10]; % locations of loading
F_y = [357, 0, -197, -885, 0, 725]; % forces in y
F_z = [115, 0, 540, -2431, 0, -1776]; % forces in z
T = [0, 0, 3240, 0, 0, 0]; % torsion in shaft

Diam = [1.5, 1.75 2.25 1.75 1.5 1.5]; % inches
S_UT = 68E3; % psi

%%%%%%%% an interpolation vector
x_interp = linspace(x(1), x(end), 1000);

Diam_interp = interp1(x, Diam, x_interp, 'previous');

%%%%%%%% Construct the shear diagram
shear_y = cumsum(F_y);
shear_z = cumsum(F_z);

shear_y_interp = interp1(x, shear_y, x_interp, 'previous');
shear_z_interp = interp1(x, shear_z, x_interp, 'previous');

x_rng = [-1, 11];
figure(1)
clf;
subplot(3,2,1);
plot(x_interp, Diam_interp, 'k');
hold on
plot(x_interp, -Diam_interp, 'k');
plot(x_interp(1)*[1,1], Diam_interp(1)*[-1,1],'k')
plot(x_interp(end)*[1,1], Diam_interp(end)*[-1,1],'k')
axis([x_rng, -5, 5]);

subplot(3,2,2);
plot(x_interp, Diam_interp, 'k');
hold on
plot(x_interp, -Diam_interp, 'k');
plot(x_interp(1)*[1,1], Diam_interp(1)*[-1,1],'k')
plot(x_interp(end)*[1,1], Diam_interp(end)*[-1,1],'k')
axis([x_rng, -5, 5]);


subplot(3,2,3);
plot(x_interp, shear_y_interp);
hold on;
plot(x_interp, x_interp*0+1, 'k--')
axis([x_rng, -1000, 500]);
xlabel('X position');
ylabel('XY shear');

subplot(3,2,4);
plot(x_interp, shear_z_interp);
hold on
plot(x_interp, x_interp*0+1, 'k--')
axis([x_rng, -5000, 1000]);
xlabel('X position');
ylabel('XZ shear');

%%%%%%%% Construct the moment diagram
moment_y_interp = cumtrapz(x_interp, shear_y_interp);
moment_z_interp = cumtrapz(x_interp, shear_z_interp);

subplot(3,2,5);
plot(x_interp, moment_y_interp);
axis([x_rng, 0, 2000]);
xlabel('X position');
ylabel('Z moment');

subplot(3,2,6);
plot(x_interp, moment_z_interp);
axis([x_rng, 0, 5000]);
xlabel('X position');
ylabel('Y moment');


%%%%%%%% Construct the net torsion and net moment
total_moment_interp = sqrt(moment_y_interp.^2 + moment_z_interp.^2);

figure(2)
clf;
subplot(3,1,1);
plot(x_interp, Diam_interp, 'k');
hold on
plot(x_interp, -Diam_interp, 'k');
plot(x_interp(1)*[1,1], Diam_interp(1)*[-1,1],'k')
plot(x_interp(end)*[1,1], Diam_interp(end)*[-1,1],'k')
axis([x_rng, -5, 5]);


subplot(3,1,2);
plot(x_interp, total_moment_interp)
axis([x_rng, 0, 5000]);
xlabel('X position');
ylabel('Vector magnitude of moment');

T_interp = interp1(x, T, x_interp, 'previous');
subplot(3,1,3);
plot(x_interp, T_interp)
axis([x_rng, 0, 4000]);
xlabel('X position');
ylabel('Vector magnitude of moment');

%%%%%%%% Calculate alternating and mean stresses

sigma_a = 32*total_moment_interp ./ (pi * Diam_interp.^3);
sigma_m = 16*T_interp ./ (pi * Diam_interp.^3);

figure(3)
clf;
subplot(3,1,1);
plot(x_interp, Diam_interp, 'k');
hold on
plot(x_interp, -Diam_interp, 'k');
plot(x_interp(1)*[1,1], Diam_interp(1)*[-1,1],'k')
plot(x_interp(end)*[1,1], Diam_interp(end)*[-1,1],'k')
axis([x_rng, -5, 5]);


subplot(3,1,2);
plot(x_interp, sigma_a)
axis([x_rng, 0, 1.2*max(sigma_a)]);
xlabel('X position');
ylabel('Alternating stress');

subplot(3,1,3);
plot(x_interp, sigma_m)
axis([x_rng, 0, 1.2*max(sigma_m)]);
xlabel('X position');
ylabel('Mean stress');

%%%%%%%% Calculate S_E and mean stresses

k_a = 2*(S_UT/1000)^(-0.217);       % cold drawn (equation takes in kpsi)
k_b = k_b_function(Diam_interp);           % D < 2 inches
k_c = 1;
k_d = 1;
k_e = 1;


S_e = k_a*k_b*k_c*k_d*k_e*(0.5)*S_UT;

% %%%%%%%% Calculate safety factor through shaft

SF = (sigma_a ./ S_e + sqrt(3)*sigma_m / S_UT).^(-1);

figure(4)
clf;
subplot(4,1,1);
plot(x_interp, Diam_interp, 'k');
hold on
plot(x_interp, -Diam_interp, 'k');
plot(x_interp(1)*[1,1], Diam_interp(1)*[-1,1],'k')
plot(x_interp(end)*[1,1], Diam_interp(end)*[-1,1],'k')
axis([x_rng, -5, 5]);

subplot(4,1,2);
plot(x_interp, total_moment_interp)
axis([x_rng, 0, 5000]);
xlabel('X position');
ylabel('Vector magnitude of moment');

T_interp = interp1(x, T, x_interp, 'previous');
subplot(4,1,3);
plot(x_interp, T_interp)
axis([x_rng, 0, 4000]);
xlabel('X position');
ylabel('Vector magnitude of moment');

subplot(4,1,4);
plot(x_interp, SF)
hold on
plot(x_interp, x_interp*0+1, 'k--')
axis([x_rng, 0, 10]);
xlabel('X position');
ylabel('Design safety factor');




%%
%%%%%%%%%%%%%%%%%% Helper functions
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




