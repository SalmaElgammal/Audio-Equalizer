function [ ] = plot_bands(b, fs,num )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
  figure;
  subplot(2,1,1);
  len = length(b);
  t = linspace(0, len/fs, len);
  plot(t,b);
  title(['band ',num2str(num), ' in time domain']);
  xlabel('Time(S)');
  ylabel('Amplitude(db)');
  
  subplot(2,1,2);
  f = -fs/2:fs/(len-1):fs/2;
  FFT_band = fftshift(fft(b))/length(fft(b));
  plot(f,abs(FFT_band));
  title(['band ',num2str(num),' in Freq. domain']);
  xlabel('Freq(Hz)');
  ylabel('Magnitude(db)');

        
%   f=linspace(0, rate, len);
%   G=abs(fft(b, len));
%   plot(f(1:len/2), G(1:len/2))
 


end

