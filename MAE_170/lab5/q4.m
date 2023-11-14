
close all;
for i = 1:30

figure
plot(t,recMatrix_ref(:,i,5))
hold on
plot(t,recMatrix_sig(:,i,5))
end