function Hd = FIR_EQUIR_LP(Fs,N,Fpass,Fstop)
%FIR_EQUIR_LP Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the Signal Processing Toolbox 7.4.
% Generated on: 14-Dec-2018 16:43:12

% Equiripple FIR Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.

Wpass = 1;    % Passband Weight
Wstop = 1;    % Stopband Weight
dens  = 20;   % Density Factor

b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
       
Hd = dfilt.dffir(b);

% [EOF]