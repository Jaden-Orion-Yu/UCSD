g = @(t,y) t*(t-1)
[x2,y2] = Euler(0.1, 0,3,20,g)
[x1,y1] = ode45(g, [0,20], 3)


a1 = y1(21)
a2 = y2(101)
% 
answ = a1-a2