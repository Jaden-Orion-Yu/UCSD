%% Getting the offset

% load('lab8_part2_control.mat')
% 
% H_offset = mean(Hchb) - mean(Hamb);
% T_offset = mean(Tchb) - mean(Tamb);

%% Enter your measured / experimentally determined parameters here
T_correction = -0.165886654479049; % experimentally determined relative temp offset
H_correction = 0.403217550274206; % experimentally determined relative RH offset
leaf_area = 17.592; % leaf cross-sectional area (cm^2)
flow_rate = 493.58; % pump flow rate (cm^3 / min)

% assuming chamber sensor is "correct":
% apply corrections to ambient temp & RH
Tamb2 = Tamb + T_correction;
Hamb2 = Hamb + H_correction;

% calculate chamber saturation vapor pressure & vapor density
% using the equations in the lab procedure
SVPchb = 0.61078 .* exp(17.24 .* Tchb ./ (Tchb + 237.3));
VDchb = Hchb .* SVPchb ./ (4.62E-4 * (Tchb + 273.15));

% calculate ambient saturation vapor pressure & vapor density
% using the equations in the lab procedure
SVPamb = 0.61078 .* exp(17.24 .* Tamb2 ./ (Tamb2 + 237.3));
VDamb = Hamb2 .* SVPamb ./ (4.62E-4 * (Tamb2 + 273.15));

% calculate vapor density gradient
deltaRHO = VDchb - VDamb;

% Calculate transpiration rate
% UNITS
% mg/m^2/sec = mg / m3    *         m3 / s          *    1 / m2                       
tRate = (deltaRHO * 1e3) * (flow_rate /60 * 1e-6)  * (1 / leaf_area * 1e4);

figure(1)
plot(t, tRate, 'b')
ylabel('Tranpiration Rate (mg/m^2/s)')
xlabel('Time (s)')