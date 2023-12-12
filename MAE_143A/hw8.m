clear
clc
%% Problem 1
fx = 10;
fs = 12;

xf = @(t) cos(20.*pi.*t);
xs = @(t) cos(24.*pi.*t);
xr = @(t) cos(4.*pi.*t);

t = linspace(0,1,10000);

yf = xf(t);
yr = xr(t);
x = []
y = []
for i = 1:length(t)
    if abs(yr(i)  - yf(i)) < 0.005
       x(length(x)+1) = t(i);
       y(length(y)+1) = yf(i);
    end
end

figure(1)
%subplot(2,1,1)
plot(t,yf,'b')
hold on
plot(x,y,'.r');
title('cosine function and recovery')
legend('continuous signal','sampled')




%% Problem 3

H3 = @(w) (exp(2.*i.*w))./((exp(i.*w) - 0.6).*(exp(i.*w) + 0.4))

w3 = linspace(-pi,pi);
figure(2)
subplot(2,1,1)
plot(w3,abs(H3(w3)))
title('magnitude of H')
xlabel('omega')
ylabel('magnitude')
xlim([-pi,pi])
subplot(2,1,2)
plot(w3,angle(H3(w3)))
title('phase angle of H')
xlabel('omega')
ylabel('phase')
xlim([-pi,pi])

%% Problem 6
x6 = [3 4 1 -2]
x6fft = fft(x6)
x6ifft = ifft(x6fft)

%% Problem 7
load('imageData.mat');
I = Inew;
Inewa = double(rgb2gray(I));

f1 = fft2(Inewa);
f1 = fftshift(f1);
mag = abs(f1);
phase = angle(f1);
const = mag.*exp(j.*phase)

figure(3)
subplot(2,2,1)
imshow(Inewa,[])
title('original grayscale')
subplot(2,2,2)
imshow(phase,[])
title('phase')
subplot(2,2,3)
imshow(log(abs(f1)),[])
title('magnitude')
subplot(2,2,4)
imshow(abs(ifft2(const)),[])
title('reconstructed')

filt = [1 1 1; 1 1 1; 1 1 1];
cor = filter2(filt, Inewa);
f2 = fft2(cor);
f2 = fftshift(f2);
mag2 = abs(f2);
phase2 = angle(f2);
const2 = mag2.*exp(j.*phase);

figure(4)

subplot(2,2,1)
imshow(cor,[])
title('filtered grayscale')
subplot(2,2,2)
imshow(phase2,[])
title('phase')
subplot(2,2,3)
imshow(log(abs(f2)),[])
title('magnitude')
subplot(2,2,4)
imshow(abs(ifft2(const2)),[])
title('filtered reconstructed')

