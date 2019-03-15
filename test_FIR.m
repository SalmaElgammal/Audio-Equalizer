function [  ] = test_FIR( )
clear sound;


[input ,Fs] = audioread('testFir.wav');
rate = 1;
figure;
subplot(2,1,1);
plot_input(input,Fs, 1 );
subplot(2,1,2);
plot_input(input,Fs, 2);
% prompt='Rate:\n1-normal\n2-half\n3-double\n';
% rate = input(prompt);
% if rate == 1
%     rate = Fs;
% end
% if rate==2
%     rate = Fs * 0.5;
% end
% if rate==3
%     rate = Fs * 2;
% end
gains = zeros(9,1);
gains(1) = 20;
gains(2) = 20;
gains(3) = 2;
gains(4) = 0;
gains(5) = 20;
gains(6) = 0;
gains(7) = 0;
gains(8) = 15;
gains(9) = 0;
% gains(1) = input(prompt);
% prompt='gain2 = ';
% gains(2) = input(prompt);
% prompt='gain3 = ';
% gains(3) = input(prompt);
% prompt='gain4 = ';
% gains(4) = input(prompt);
% prompt='gain5 = ';
% gains(6) = input(prompt);
% prompt='gain7 = ';
% gains(7) = input(prompt);
% prompt='gain8 = ';
% gains(8) = input(prompt);
% prompt='gain9 = ';
% gains(9) = input(prompt);

%prompt='Type:\n1-EUIR\n2-LS\n';
type = 1;
order = 15;
rate = Fs*rate;

[b1, b2, b3, b4, b5, b6, b7, b8, b9, bands_sum] = FIR(input, Fs, order, type, gains);

figure;
subplot(2,1,1);
plot_output(bands_sum,rate, 1 );
subplot(2,1,2);

plot_output(bands_sum,rate, 2 );
sound(bands_sum, rate);


plot_bands(b1, Fs,1);
plot_bands(b2, Fs,2);
plot_bands(b7, Fs,7);
plot_bands(b8, Fs,8);




% plot_bands(b2, Fs);
% 
% 
% plot_bands(b3, Fs);
% 
% plot_bands(b4, Fs);
% 
% plot_bands(b5, Fs);
% 
% 
% plot_bands(b6, Fs);
% 
% 
% plot_bands(b7, Fs);
% 
% plot_bands(b8, Fs);
% 
% 
% plot_bands(b9, Fs);





end

