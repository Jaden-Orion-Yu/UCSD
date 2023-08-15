%% Sample for matlab 2

% f = @(x,y) (cos(x) + sin(x))*(1-y);
% slopefield(f, [-2,2], [-2,8], 20);
% hold on;
% drawode(f, [-2,2],1,2);
% drawode(f, [-2,2],0,0);
% hold off;
% 
% A = 3;
% k = 0.4;
% 
% f = @(x,y) (0.4*(69-y));
% slopefield(f, [0,10], [-10,80], 20);
%% Exercise 2.5
% g = @(t,Y) [-3; 40];
% 
% phaseplane(g, [-5,5],[-5,5],20)

%%exercise 2.6
% g = @(t,Y) [Y(1);-Y(2)];
% phaseplane(g, [-10,10], [-10,10],20)
% hold on;
% drawphase(g, 10, 2,4);
% drawphase(g, 10, .1,10);
% hold off;

%exercise 2.7
% f = @(x,y) (cos(x) + sin(y));
% g = @(t,Y) [cos(Y(1)) + sin(Y(2));1];
% 
% % slopefield(f, [-5,5], [-5,5],20);
% % hold on;
% % drawode(f,[-5,5],0,2);
% % hold off;
% figure(1);
% phaseplane(g, [-5,5],[-5,5],20)
% hold on;
% drawphase(g,5,0,1)
% hold off

%exercise 2.8
a = 3;
b = 1;
c = 2;
d = 3;
g = @(t,Y) [Y(1)*(a - b*Y(2)); c*Y(2)*(Y(1)-d)];
phaseplane(g, [-1,10],[-1,10],20)
hold on;
drawphase(g,25,0,3);
drawphase(g,25,0,1);
drawphase(g,25,3,3);
drawphase(g,25,5,6);
