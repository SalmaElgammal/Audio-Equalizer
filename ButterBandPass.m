function Hd = ButterBandPass(fs,n,fc1,fc2)
%BUTTERWORTH2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.0 and the Signal Processing Toolbox 7.2.
% Generated on: 16-Dec-2018 04:00:05

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = fs;  % Sampling Frequency

N   = n;   % Order
Fc1 = fc1;  % First Cutoff Frequency
Fc2 = fc2;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]
