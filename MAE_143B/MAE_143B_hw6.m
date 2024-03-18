clear;
clc;

%% P4
% i
sys = rss(3);
p = pole(sys)
% ii
time = 0:0.001:40;
omega = [0.2; 2; 20];
% iii
% A
u = zeros(3,length(time));
z = u;
for k = 1:1:3
    u(k,:) = cos(omega(k).*time);
    z(k,:) = sin(omega(k).*time);
end
% B
y1 = lsim(sys,u(1,:),time);
y2 = lsim(sys,u(2,:),time);
y3 = lsim(sys,u(3,:),time);

% C
costerm1 = mean(u(1,:).*y1);
costerm2 = mean(u(2,:).*y2);
costerm3 = mean(u(3,:).*y3);

sinterm1 = mean(z(1,:).*y1);
sinterm2 = mean(z(2,:).*y2);
sinterm3 = mean(z(3,:).*y3);

%% D

mag1_man = abs(freqresp(sys, omega(1)))
mag2_man = abs(freqresp(sys, omega(2)))
mag3_man = abs(freqresp(sys, omega(3)))

phase1_man = angle(freqresp(sys, omega(1)))
phase2_man = angle(freqresp(sys, omega(2)))
phase3_man = angle(freqresp(sys, omega(3)))

%%  E
[mag1,pha1] = bode(sys, omega(1))
[mag2,pha2] = bode(sys, omega(2))
[mag3,pha3] = bode(sys, omega(3))

% F

H = tf([1 0.1 7.5],[1 0.12 9 0 0]);
w = logspace(-1,1,100);
w = sort([w 0.2 2 20], 'ascend');                                % Add Point & Sort
wix1 = find(w == 0.2);
wix2 = find(w == 2);
wix3 = find(w == 20);  % Find Index Of point
[mag,phase] = bode(H,w);
figure(1)
subplot(2,1,1)
loglog(w, squeeze(mag), w(wix1), mag(1,1,wix1), 'gp')
hold on
loglog(w, squeeze(mag), w(wix2), mag(1,1,wix2), 'gp')
hold on
loglog(w, squeeze(mag), w(wix3), mag(1,1,wix3), 'gp')
hold on
text(w(wix1), mag(1,1,wix1), '0.2 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
text(w(wix2), mag(1,1,wix2), '2 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
text(w(wix3), mag(1,1,wix3), '20 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
grid on
ylabel('Magnitude (Db)')
subplot(2,1,2)
semilogx(w, squeeze(phase), w(wix1), phase(1,1,wix1), 'gp')
hold on
semilogx(w, squeeze(phase), w(wix2), phase(1,1,wix2), 'gp')
hold on
semilogx(w, squeeze(phase), w(wix3), phase(1,1,wix3), 'gp')
hold on
text(w(wix1), phase(1,1,wix1), '0.2 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
text(w(wix2), phase(1,1,wix2), '2 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
text(w(wix3), phase(1,1,wix3), '20 Rads/s\uparrow', 'HorizontalAlignment','right', 'VerticalAlignment','top')
xlabel('Frequency (Rads/s)')
ylabel('Phase (deg)')
grid on


% figure(1)
% bode(sys);
% hold on
% % plot(omega(1),mag1,'*',omega(2), mag2,'*', omega(3),mag3,'*')
% % hold on
% % plot(omega(1),pha1,'*',omega(2), pha2,'*', omega(3),pha3,'*')
% % grid on






