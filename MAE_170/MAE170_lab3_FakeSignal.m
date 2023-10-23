Fs = 1000;
time = (0:1/Fs:1); % Time vector

%for each new signal change "30" input new frequency, EG for 200hz input
%200.
signal = sin(2*pi*1000*time);

[freq, amp]=MAE170fft(time, signal);
figure(2)

semilogy(freq, amp,'-ob','LineWidth',2,'MarkerSize',4);
set(gca,'FontSize',22,'LineWidth',2);
xlabel('frequency [Hz]')
ylabel('|FT|');
title("pred 1000hz")

fInput = [200;400;600;800;1000];

%fPred = [199.98;399.96;599.94;799.92;999.9];


data200 = readcell('200data.xlsx');
data400 = readcell('400data.xlsx');
data600 = readcell('600data.xlsx');
data800 = readcell('800data.xlsx');
data1000 = readcell('1000data.xlsx');


%import data from excell

tArd200 = cell2mat(data200(:,1)); 
vArd200 = cell2mat(data200(:,2));
tOsc200 = cell2mat(data200(1:598,3));
vOsc200 = cell2mat(data200(1:598,4));

tArd400 = cell2mat(data400(:,1));
vArd400 = cell2mat(data400(:,2));
tOsc400 = cell2mat(data400(1:598,3));
vOsc400 = cell2mat(data400(1:598,4));

tArd600 = cell2mat(data600(:,1));
vArd600 = cell2mat(data600(:,2));
tOsc600 = cell2mat(data600(1:598,3));
vOsc600 = cell2mat(data600(1:598,4));

tArd800 = cell2mat(data800(:,1));
vArd800 = cell2mat(data800(:,2));
tOsc800 = cell2mat(data800(1:598,3));
vOsc800 = cell2mat(data800(1:598,4));

tArd1000 = cell2mat(data1000(:,1));
vArd1000 = cell2mat(data1000(:,2));
tOsc1000 = cell2mat(data1000(1:598,3));
vOsc1000 = cell2mat(data1000(1:598,4));

FsArd = [0;0;0;0;0];
FsOsc = [0;0;0;0;0];
for i = 1:10
    switch i
        case 1
            period = 0;
            for n = 1:997
                period = period + tArd200(i+1) - tArd200(i);
            end
            FsArd(1) = 1/(period/998);
        case 2
            period = 0;
            for n = 1:597
                period = period + tOsc200(i+1) - tOsc200(i);
            end
            FsOsc(1) = 1/(period/598);
        case 3
            period = 0;
            for n = 1:997
                period = period + tArd400(i+1) - tArd400(i);
            end
            FsArd(2) = 1/(period/998);
        case 4
            period = 0;
            for n = 1:597
                period = period + tOsc200(i+1) - tOsc200(i);
            end
            FsOsc(2) = 1/(period/598);
        case 5
            period = 0;
            for n = 1:997
                period = period + tArd600(i+1) - tArd600(i);
            end
            FsArd(3) = 1/(period/998);
        case 6
            period = 0;
            for n = 1:597
                period = period + tOsc600(i+1) - tOsc600(i);
            end
            FsOsc(3) = 1/(period/598);
        case 7
            period = 0;
            for n = 1:997
                period = period + tArd800(i+1) - tArd800(i);
            end
            FsArd(4) = 1/(period/998);
        case 8
            period = 0;
            for n = 1:597
                period = period + tOsc800(i+1) - tOsc800(i);
            end
            FsOsc(4) = 1/(period/598);
        case 9
            period = 0;
            for n = 1:997
                period = period + tArd1000(i+1) - tArd1000(i);
            end
            FsArd(5) = 1/(period/998);
        case 10
            period = 0;
            for n = 1:597
                period = period + tOsc1000(i+1) - tOsc1000(i);
            end
            FsOsc(5) = 1/(period/598);
    end
end




%the peak on the FTT for any

% figure(1);
% plot(time, signal,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('time (s)')
% ylabel('Amplitude (a.u.)');



%% graphing oscilloscope
%[freq, amp]=MAE170fft(time, signal);
% figure(2)
 [freqOsc200,ampOsc200] = MAE170fft(tOsc200,vOsc200);
% semilogy(freqOsc200, ampOsc200,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Osc  FTT 200hz")
% figure(3)
 [freqOsc400,ampOsc400] = MAE170fft(tOsc400,vOsc400);
% semilogy(freqOsc400, ampOsc400,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Osc FTT  400hz")
% figure(4)
 [freqOsc600,ampOsc600] = MAE170fft(tOsc600,vOsc600);
% semilogy(freqOsc600, ampOsc600,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Osc FTT  600hz")
% figure(5)
 [freqOsc800,ampOsc800] = MAE170fft(tOsc800,vOsc800);
% semilogy(freqOsc800, ampOsc800,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Osc FTT  800hz")
% figure(6)
 [freqOsc1000,ampOsc1000] = MAE170fft(tOsc1000,vOsc1000);
% semilogy(freqOsc1000, ampOsc1000,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Osc FTT 1000hz")

%% graphing arduino
% figure(7)
 [freqArd200,ampArd200] = MAE170fft(tArd200,vArd200);
% semilogy(freqArd200, ampArd200,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard FTT 200hz")
% figure(8)
 [freqArd400,ampArd400] = MAE170fft(tArd400,vArd400);
% semilogy(freqArd400, ampArd400,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard FTT 400hz")
% figure(9)
 [freqArd600,ampArd600] = MAE170fft(tArd600,vArd600);
% semilogy(freqArd600, ampArd600,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard FTT 600hz")
% figure(10)
 [freqArd800,ampArd800] = MAE170fft(tArd800,vArd800);
% semilogy(freqArd800, ampArd800,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard FTT 800hz")
% figure(11)
 [freqArd1000,ampArd1000] = MAE170fft(tArd1000,vArd1000);
% semilogy(freqArd1000, ampArd1000,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard FTT 1000hz")

%% checking original frequencies;
% semilogy(tArd200, vArd200,'-ob','LineWidth',2,'MarkerSize',4);
% set(gca,'FontSize',22,'LineWidth',2);
% xlabel('frequency [Hz]')
% ylabel('|FT|');
% title("Ard 1000hz")

ardFTTfreq = [203.725;407.499;385.479;181.754;21.9703];
oscFTTfreq = [208.333;416.667;666.667;833.333;1000];
ardFreq = [2000;2000;2000;2000;2000];
oscFreq = [24916;49831;99667;99667;99667];

tNames = {"Fs input","Arduino Fs","Oscope Fs","Arduino Ftt Fs","Oscope Ftt Fs","Predicted Frequency"};

%T = table(Finput,ardFreq,oscFreq,ardFTTfreq,oscFTTfreq,Fpred,'CollumnNames')


%% graph of aliasing
figure(15)
plot(fInput,ardFTTfreq,'--*r');
hold on;
plot(fInput,oscFTTfreq,'--*g');
hold on;
% plot(fInput,ardFreq,'--*b');
% hold on;
% I think there's an error with the oscope and arduino frequency
% plot(fInput,oscFreq,'--*c');
% hold on;
plot(fInput,fPred,'--*m');
hold on;
xline(500,'--k')
hold on
legend('Arduino FTT Frequency','Oscope FTT Frequency','Predicted Frequency','Aliasing Point for Arduino')
set(gca,'FontSize',22,'LineWidth',2);
xlabel('input frequency [hz]')
ylabel('output freq');
grid on;
title("Aliasing comparison")


function [frequencyVar, amplitudeVar] = MAE170fft(tVar, yVar)
    reps=length(tVar); % obtain number of samples
    fs=1/mean(diff(tVar)); % calculate mean sampling rate
    % calculate oscilloscope signal PSD
    [PSD,f_psd] = periodogram(yVar,rectwin(reps),reps,fs,'onesided');
    frequencyVar = f_psd;
    amplitudeVar = sqrt(PSD);
end