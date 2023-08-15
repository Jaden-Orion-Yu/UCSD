%graph 1: 
% There are 1000 living residences in the community (all infection-free),
% • Human can kill zombie at the rate of 0.01,
% • Zombies can turn a (non-infected) human into one of them at the rate of 0.015,
% • Deceased human can “rise up” and become zombie at the rate of 0.005,
% • Ignore the background birth and (non-zombie-related) death rates,
% • Time window: 7 units of time,
% • Use the recommended step-size for Euler’s method from MatLab
% assignments. h = dt = 0.1

%values that stay constant for all simulations
d = 0;
T = 7;
dt = 0.01;
ze = 0.005;


%variable values for first Simulation
a1 = 0.01;
b1 = 0.015;
N1 = 1000;
Z1 = 0;
title1 = 'Simulation 1: no zombies in base population';
figno1 = 1;
%zombies(a1,b1,ze,d,T,dt,N1,Z1,title1,figno1)

%variable values for second Simulation
a2 = a1;
b2 = b1;
N2 = 999;
Z2 = 1;
title2 = 'Simulation 2: 1 zombie in base population';
figno2 = 2;
%zombies(a2,b2,ze,d,T,dt,N2,Z2,title2,figno2)

%variables changed for thrid sumulation: alpha decreased by factor of 10
a3 = 0.001;
b3 = 0.015;
N3 = N2;
Z3 = Z2;
title3 = 'Simulation 3: Defeat parameter decreased by 10';
figno3 = 3;
zombies(a3,b3,ze,d,T,dt,N3,Z3,title3,figno3)

%variables changed for fourth sumulation: Beta decreased by factor of 10
a4 = 0.01;
b4 = 0.0015;
N4 = N2;
Z4 = Z2;
title4 = 'Simulation 4: Transmission parameter decreased by a factor of 10';
figno4 = 4;
%zombies(a4,b4,ze,d,T,dt,N4,Z4,title4,figno4)

%variables changed for fourth sumulation: Alpha reduced to zero
a5 = 0.00;
b5 = 0.015;
N5 = N2;
Z5 = Z2;
title5 = 'Simulation 5: no defeat parameter';
figno5 = 5;
%zombies(a5,b5,ze,d,T,dt,N5,Z5,title5,figno5)

