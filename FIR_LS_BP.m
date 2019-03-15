function Hd = FIR_LS_BP(Fs,N,Fstop1,Fpass1,Fpass2,Fstop2)
%FIR_BP_LEAST_SQUARES Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.2 and the Signal Processing Toolbox 6.20.
% Generated on: 24-Jan-2016 16:01:16

% FIR least-squares Bandpass filter designed using the FIRLS function.

% All frequency values are in Hz.
Wstop1 = 1;      % First Stopband Weight
Wpass  = 1;      % Passband Weight
Wstop2 = 1;      % Second Stopband Weight

% Calculate the coefficients using the FIRLS function.
b  = firls(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2]);
Hd = dfilt.dffir(b);

% [EOF]
