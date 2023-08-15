function [T, X, Y, Z, U, V, W] = satellite(Xo, Yo, Zo, Uo, Vo, Wo, Tf)
%SATELLITE Takes in initial coordinate and velocity values and returns
%positional and velocity arrays
%   Takes in Variables Xo, Yo, Zo, Uo, Vo, Wo, Tf, which are initial
%   positional and velocity variables as well as the final time (ins) and
%   calculates the final T, X, Y, Z, U, V, W using the euler-cromer method.

%constants
Re = 6.37*(10^6);
Me = 5.97*(10^24);
G = 6.67408*(10^(-11));
m = 250;
As = 0.25;
Pa = 5.5*(10^(-12));
Cd = 2.2;
dt = 1;

%initialize
n = 1;
X = zeros(1,Tf +1);
Y = zeros(1,Tf +1);
Z = zeros(1,Tf +1);
U = zeros(1,Tf +1);
V = zeros(1,Tf +1);
W = zeros(1,Tf +1);
X(n) = Xo;
Y(n) = Yo;
Z(n) = Zo;
V(n) = Vo;
U(n) = Uo;
W(n) = Wo;
T(n) = 0;

while T(n) < Tf    
    U(n+1) = U(n) - (((   G*Me*   (X(n)   /   (   (X(n)^2)    +   (Y(n)^2)    +   (Z(n)^2)    )^(3/2)  )   ) + (((Cd*Pa*As)/(2*m))*U(n)*sqrt((   (U(n)^2)    +   (V(n)^2)    +   (W(n)^2)    ))) )*dt);
    
    V(n+1) = V(n) - (((   G*Me*   (Y(n)   /   (   (X(n)^2)    +   (Y(n)^2)    +   (Z(n)^2)    )^(3/2)  )   ) + (((Cd*Pa*As)/(2*m))*V(n)*sqrt((   (U(n)^2)    +   (V(n)^2)    +   (W(n)^2)    ))) )*dt);
    
    W(n+1) = W(n) - (((   G*Me*   (Z(n)   /   (   (X(n)^2)    +   (Y(n)^2)    +   (Z(n)^2)    )^(3/2)  )   ) + (((Cd*Pa*As)/(2*m))*W(n)*sqrt((   (U(n)^2)    +   (V(n)^2)    +   (W(n)^2)    ))) )*dt);
    
    X(n+1) = X(n) + (U(n+1)*dt);
    
    Y(n+1) = Y(n) + (V(n+1)*dt);
    
    Z(n+1) = Z(n) + (W(n+1)*dt);
    
    T(n+1) = T(n) + dt;

    n = n+1;
end

    function [h] = altitude(X,Y,Z,Re)
        h = sqrt((X.^2)+ (Y.^2) + (Z.^2)) - Re;
    end
    function [Vmag] = speed(U,V,W)
        Vmag = sqrt((U.^2)+ (V.^2) + (W.^2)) - Re;
    end
end