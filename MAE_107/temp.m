fa = @(x) atan(x + (2*x^3)/3) - 0.7;
fap = @(x) (2*x^2 + 1)/(((2*x^3)/3 + x)^2 + 1);
fb= @(x) x + (2*x^3)/3 + tan(0.7);
fbp= @(x) 2*x^2 + 1;

x0 = 0;

xa1 = x0 - (fa(x0)/fap(x0))
xa2 = xa1 - (fa(xa1)/fap(xa1))
xa3 = xa2 - (fa(xa2)/fap(xa2))
xa4 = xa3 - (fa(xa3)/fap(xa3))
xa5 = xa4 - (fa(xa4)/fap(xa4))

xb1 = 0 - (fb(0)/fbp(0))
xb2 = xb1 - (fb(xb1)/fbp(xb1))
xb3 = xb2 - (fb(xb2)/fbp(xb2))
xb4 = xb3 - (fb(xb3)/fbp(xb3))
xb5 = xb4 - (fb(xb4)/fbp(xb4))

abs(fa(xa5)) <= 10^(-12)


