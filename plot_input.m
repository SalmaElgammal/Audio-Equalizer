function [  ] = plot_input(inputSignal,Fs )
len = length(inputSignal);
figure;
  subplot(2,1,1);

       t=linspace(0, len/Fs,len);
       plot(t, inputSignal); 
       title('input in time domain');
       xlabel('Time(S)');
       ylabel('Amplitude(db)');
         subplot(2,1,2);

        f = -Fs/2:Fs/(len-1):Fs/2;
        FFT_audio_in = fftshift(fft(inputSignal))/length(fft(inputSignal));
        plot(f,abs(FFT_audio_in));
           
%         f=linspace(0, rate, Nfft);
%         G=abs(fft(inputSignal, Nfft));
%         plot(f(1:Nfft/2), G(1:Nfft/2));
        title('input in Freq. domain');
        xlabel('Freq(Hz)');
        ylabel('Magnitude(db)');


end
