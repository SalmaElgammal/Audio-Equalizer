function [  ] = plot_output(outSignal,rate )
len = length(outSignal);
figure;
  subplot(2,1,1);

      t=linspace(0, len/rate,len);
       plot(t, outSignal); 
       title('output in time domain');
       xlabel('Time(S)');
       ylabel('Amplitude(db)');
        subplot(2,1,2);
 
        f = -rate/2:rate/(len-1):rate/2;
        FFT_audio_out = fftshift(fft(outSignal))/length(fft(outSignal));
        plot(f,abs(FFT_audio_out));
%         f=linspace(0, rate, Nfft);
%         G=abs(fft(outSignal, Nfft));
%         plot(f(1:Nfft/2), G(1:Nfft/2));
       title('output in Freq. domain');
       xlabel('Freq(Hz)');
       ylabel('Magnitude(db)');


end

