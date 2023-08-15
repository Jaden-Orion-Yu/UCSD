function [T, X, Y, Z, U, V, W] = satellite(Xo, Yo, Zo, Uo, Vo, Wo, Tf)
% Function Satellite takes in a satellites coordinate points (X , Y , Z)
% and its and its initial velocity (U, V, W) and the total simulation time
% (Tf) and then inputs these values into an equation to then output the
% trajectory of the satellite at a given time within the simulation time period with the
% values T = (Time) (X, Y, Z) = Position (U, V, W) = Velocity
R = 6.37*(10^6);
M = 5.97*(10^24);
G = 6.67408*(10^(-11));
m = 250;
A = 0.25;
p = 5.5*(10^(-12));
C = 2.2;
dt = 1;
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
    U(n+1) = U(n)-(((G*M*(X(n)/((X(n)^2)+(Y(n)^2)+(Z(n)^2))^(3/2)))+(((C*p*A)/(2*m))*U(n)*sqrt(((U(n)^2)+(V(n)^2)+(W(n)^2)))))*dt);

    V(n+1) = V(n)-(((G*M*(Y(n)/((X(n)^2)+(Y(n)^2)+(Z(n)^2))^(3/2)))+(((C*p*A)/(2*m))*V(n)*sqrt(((U(n)^2)+(V(n)^2)+(W(n)^2)))))*dt);

    W(n+1) = W(n)-(((G*M*(Z(n)/((X(n)^2)+(Y(n)^2)+(Z(n)^2))^(3/2)))+(((C*p*A)/(2*m))*W(n)*sqrt(((U(n)^2)+(V(n)^2)+(W(n)^2)))))*dt);

    X(n+1) = X(n)+(U(n+1)*dt);

    Y(n+1) = Y(n)+(V(n+1)*dt);

    Z(n+1) = Z(n)+(W(n+1)*dt);

    T(n+1) = T(n)+dt;

    n = n+1;
end

    function [h] = altitude(X,Y,Z,R)
        h = sqrt((X.^2)+ (Y.^2) + (Z.^2)) - R;
    end
    function [Vmag] = speed(U,V,W)
        Vmag = sqrt((U.^2)+ (V.^2) + (W.^2)) - R;
    end
end
