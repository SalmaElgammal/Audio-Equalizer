fOut=Butter('okay.wav',[100 0 0 0 0 0 0 0 0],10);

%Plotting fOut
N=size(fOut,1);
figure;
subplot(2,1,1);
stem(1:N, fOut(:,1));
title('Time domain After filtering');
df = fs / N;
w = (-(N/2):(N/2)-1)*df;
y = fft(fOut(:,1), N) / N; % For normalizing, but not needed for our analysis
y2 = fftshift(y);
figure;
plot(w,abs(y2));
title('Freq. domain After filtering');
sound(fOut);