function [band_1, band_2, band_3, band_4, band_5, band_6, band_7, band_8 ,band_9 , bands_sum] = FIR(input, fs, order, type, gains)
%UNTITLED3 Summary of this function goes here
%   Detailed einputplanation goes here
if  type == 1
        f=FIR_EQUIR_LP(fs,order,170,180);
        band_1=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,160,170,310,320);
        band_2=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,300,310,600,610);
        band_3=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,590,600,1000,1010);
        band_4=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,990,1000,3000,3010);
        band_5=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,2990,3000,6000,6010);
        band_6=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,5990,6000,12000,12010);
        band_7=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,11990,12000,14000,14010);
        band_8=filter(f,input);
        
        f=FIR_EQUIR_BP(fs,order,13990,14000,16000,16010);
        band_9=filter(f,input);
        
elseif type == 2
        f=FIR_LS_LP(fs,order,170,180);
        band_1=filter(f,input);
        
        f=FIR_LS_BP(fs,order,160,170,310,320);
        band_2=filter(f,input);
        
        f=FIR_LS_BP(fs,order,300,310,600,610);
        band_3=filter(f,input);
        
        f=FIR_LS_BP(fs,order,590,600,1000,1010);
        band_4=filter(f,input);
        
        f=FIR_LS_BP(fs,order,990,1000,3000,3010);
        band_5=filter(f,input);
        
        f=FIR_LS_BP(fs,order,2990,3000,6000,6010);
        band_6=filter(f,input);
        
        f=FIR_LS_BP(fs,order,5990,6000,12000,12010);
        band_7=filter(f,input);
        
        f=FIR_LS_BP(fs,order,11990,12000,14000,14010);
        band_8=filter(f,input);
        
        f=FIR_LS_BP(fs,order,13990,14000,16000,16010);
        band_9=filter(f,input);
    
end

band_1_g=band_1*10^(gains(1)/20);
band_2_g=band_2*10^(gains(2)/20);
band_3_g=band_3*10^(gains(3)/20);
band_4_g=band_4*10^(gains(4)/20);
band_5_g=band_5*10^(gains(5)/20);
band_6_g=band_6*10^(gains(6)/20);
band_7_g=band_7*10^(gains(7)/20);
band_8_g=band_8*10^(gains(8)/20);
band_9_g=band_9*10^(gains(9)/20);

bands_sum = band_1_g+band_2_g+band_3_g+band_4_g+band_5_g+band_6_g+band_7_g+band_8_g+band_9_g;

end

