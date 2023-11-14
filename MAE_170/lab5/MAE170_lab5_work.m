clear;
clc;
% load('lab5_part2.mat');
% load('lab5_part1.mat');
% load('lab5_part1_badData.mat');
 load('part1b_70.mat');


%% Q2:
clear;
clc;
load('part1b_70.mat');

figure(1)
plot(t*1e3,recMatrix_sig,'-o', t*1e3,wave_sig,'-o','MarkerSize',2)
% plot(t*1e3,wave_sig,'-o','MarkerSize',2)
% hold on
% plot(t*1e3,recMatrix_sig,'-o','MarkerSize',2)
xlabel('time (ms)','interpreter','latex','FontSize',30)
ylabel('amplitude (V)','interpreter','latex','FontSize',30)
legend('64th signal', 'Average signal','interpreter','latex','FontSize',12)
set(gca,'FontSize',20,'LineWidth',2)

%% Q4
clear;clc;
load('part2_70.mat');

% for i = 1:30
% 
% figure
% plot(t,recMatrix_ref(:,i,13))
% hold on
% plot(t,recMatrix_sig(:,i,13))
% end

t_dif = zeros(1,30);
t_ref = zeros(1,30);
t_sig = zeros(1,30);

%manually found all the data points by measuring first peak of the signal
%and comparing it to the first peak of the refference
t_ref(1) = 0.00102401;
t_ref(2) = 0.00102041;
t_ref(3) = 0.00102041;
t_ref(4) = 0.00102041;
t_ref(5) = 0.00102041;
t_ref(6) = 0.00102041;
t_ref(7) = 0.00102041;
t_ref(8) = 0.00102041;
t_ref(9) = 0.00102041;
t_ref(10) = 0.00102041;
t_ref(11) = 0.00102041;
t_ref(12) = 0.00102041;
t_ref(13) = 0.00102041;
t_ref(14) = 0.00102041;
t_ref(15) = 0.00102041;
t_ref(16) = 0.00102041;
t_ref(17) = 0.00102041;
t_ref(18) = 0.00102041;
t_ref(19) = 0.00102041;
t_ref(20) = 0.00102041;
t_ref(21) = 0.00102041;
t_ref(22) = 0.00102041;
t_ref(23) = 0.00102041;
t_ref(24) = 0.00102041;
t_ref(25) = 0.00102041;
t_ref(26) = 0.00102041;
t_ref(27) = 0.00102041;
t_ref(28) = 0.00102041;
t_ref(29) = 0.00102041;
t_ref(30) = 0.00102041;



t_sig(1) = 0.00136753;
t_sig(2) = 0.00136735;
t_sig(3) = 0.00140816;
t_sig(4) = 0.00140816;
t_sig(5) = 0.00143878;
t_sig(6) = 0.00144898;
t_sig(7) = 0.0014898;
t_sig(8) = 0.0014898;
t_sig(9) = 0.00153061;
t_sig(10) = 0.00155102;
t_sig(11) = 0.00157143;
t_sig(12) = 0.00161224;
t_sig(13) = 0.00163265;
t_sig(14) = 0.00163265;
t_sig(15) = 0.00168367;
t_sig(16) = 0.00168367;
t_sig(17) = 0.00171429;
t_sig(18) = 0.00173469;
t_sig(19) = 0.0017551;
t_sig(20) = 0.00178571;
t_sig(21) = 0.00182653;
t_sig(22) = 0.00184694;
t_sig(23) = 0.00186735;
t_sig(24) = 0.00188776;
t_sig(25) = 0.00190816;
t_sig(26) = 0.00191837;
t_sig(27) = 0.00195918;
t_sig(28) = 0.00196939;
t_sig(29) = 0.0020102;
t_sig(30) = 0.00202041;

d = 0.01*sqrt((15-(13*.7))^2 + (30-(30*0.7))^2);
d_dif = linspace(d, 0.01*sqrt(30^2 + 15^2),30);

t_dif = t_sig - t_ref;

y_erP = (ones(30,1)./100000);
y_erN = (ones(30,1)./-100000);
x_erP = (0.005)*ones(30,1);
x_erN = (-0.005)*ones(30,1);

figure(2)
P = polyfit(d_dif,t_dif,1);
errorbar(d_dif,t_dif,y_erP,y_erN,x_erP,x_erN,'b')
hold on;
plot(d_dif,(1/343)*d_dif, '.-')
hold on
plot(d_dif,P(1)*d_dif,'--')
hold on
grid on
legend('Measured Data', 'Experimental Speed of Sound','Expected Speed of Sound','interpreter','latex','FontSize',12)
xlabel('distance (m)','interpreter','latex','FontSize',30)
ylabel('time delay (s)','interpreter','latex','FontSize',30)

%% Q6
figure (3)
temp = recMatrix_sig(:,:,13)/max(abs(recMatrix_sig(:,:,13)));
%temp = normalize((recMatrix_sig(:,:,13))).';
pcolor(d_dif.*100,t,normalize(recMatrix_sig(:,:,13)))
c = colorbar;
set(c,'FontSize',20);
shading interp
hold on
xlabel('X Distance (cm)','interpreter','latex','FontSize',30)
ylabel('time (s)','interpreter','latex','FontSize',30)


%% Q7
x = linspace(30,9,30);
y = linspace(15,4,15);
figure(4)
pcolor(x,y,normalize(squeeze(recMatrix_sig(197,:,:)).','center','mean'))
c = colorbar;
set(c,'FontSize',20);
shading interp
hold on
xlabel('X Distance (cm)','interpreter','latex','FontSize',30)
ylabel('Y Distance (cm)','interpreter','latex','FontSize',30)

%% Q8

filename = 'scanning.gif';
t_pcolor = 100:1:350;
for k= 1:t_pcolor
%*** your pcolor plot (as created in Q4) but for time t_pcolor(k) ***
    figure(5)
    pcolor(x,y,normalize(squeeze(recMatrix_sig(k,:,:))).')
    xlabel('X Distance (cm)','interpreter','latex','FontSize',30)
    ylabel('Y Distance (cm)','interpreter','latex','FontSize',30)
    
    clim([-1 1])
    c = colorbar;
    set(c,'FontSize',20);
    shading interp
    pause(0.5);

    drawnow;
    h = figure(5);
    frame = getframe(h); 
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);

    % Write to the GIF File
    if k==1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end