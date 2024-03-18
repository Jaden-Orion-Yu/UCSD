K = 9;
s = tf('s');
sysG = (K)/((s/0.5 + 1)*(s+1)*(s/2 + 1));
w = logspace(-1,1);
[mag,phase] = bode(sysG,w)
loglog(w, squeeze(mag)),grid;
semilogx(w,squeeze(phase));grid


% as per problem 1, want the PM to be 25 +_ 
[GM, PM, w_c, w_cp] = margin(mag, phase, w)
% PM = phase margin
% GM = gain margin0
% w_c = cross over frequency (gain crosses 1 at this frequency)
% w_cp = phase crosses -180
%solving for a and T from the pss notes
%a = 1/3 --> 30
% T = 1
%Create C(s) = 
%make new sys  = C(s) * G(s) 

