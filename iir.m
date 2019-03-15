function [band_1, band_2, band_3, band_4, band_5, band_6, band_7, band_8 ,band_9 , bands_sum] = iir(input, fs, order, type, gains)

if(type==1)     %for Butter filter
    [band_1, band_2, band_3, band_4, band_5, band_6, band_7, band_8 ,band_9 , bands_sum] =Butter(input,fs,gains,order);
elseif(type==2)    %for Cheby filter
    [band_1, band_2, band_3, band_4, band_5, band_6, band_7, band_8 ,band_9 , bands_sum]=Cheby(input,fs,gains,order);
end