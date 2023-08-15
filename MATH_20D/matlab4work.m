%exercise 2
% g = @(t,Y) [3*Y(1) + 4*Y(2); -Y(1) - 2*Y(2)];
% P = [-3,3; -3,0; -3,2; -2,-3; -1,3; 0,-3; 1,4; 2,-3; 4,-2; 4,0; 4,2];
% phaseplane(g, [-4.5,4.5], [-4.5,4.5], 16)
% hold on
% for i=1:size(P,1)
%     drawphase(g, 50, P(i,1), P(i,2))
% end
% hold off

%exercise 3
% A  = [2.7,-1;4.1,3.7]
% [eigvects,eigvals] = eig(A)
% g = @(t,Y) [2.7*Y(1) - 4*Y(2); 4.1*Y(1) + 3.7*Y(2)];
% P = [-3,3; -3,0; -3,2; -2,-3; -1,3; 0,-3; 1,4; 2,-3; 4,-2; 4,0; 4,2];
% phaseplane(g, [-4.5,4.5], [-4.5,4.5], 16)
% hold on
% for i=1:size(P,1)
%     drawphase(g, 50, P(i,1)/10, P(i,2)/10)
% end
% hold off

% Exercise 4
% A = [1.25,-0.97,4.6;-2.6,-5.2,-0.31;1.18,-10.3,1.12];
% [eigvects,eigvals] = eig(A)

%%exercise 5
A = [-0.0558 -0.9968 0.0802 0.0415;0.598 -0.115 -0.0318 0;-3.05 0.388 -0.465 0;0 0.0805 1 0];
B = [0.01; -0.175; 0.153; 0];
[evectsA,evalsA] = eig(A);

%exercise 6
% F = [0 7 0 -1];
%F = [0 5 0 -1];
F = [0 2.5 0 -.09];
%bf = B*F;
abf = A + (B*F);
[evects,evals] = eig(abf);
temp = evals