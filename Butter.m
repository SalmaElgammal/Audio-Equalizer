function [out1, out2, out3, out4, out5,out6, out7, out8 ,out9 , fOut]=Butter(f,fs, gains,n)
hd=ButterLowPass(fs,n,170);
out1=filter(hd,f);
res1=out1*10^(gains(1)/20);

hd=ButterBandPass(fs,n,170,310);
out2=filter(hd,f);
res2=out2*10^(gains(2)/20);

hd=ButterBandPass(fs,n,310,600);
out3=filter(hd,f);
res3=out3*10^(gains(3)/20);

hd=ButterBandPass(fs,n,600,1000);
out4=filter(hd,f);
res4=out4*10^(gains(4)/20);

hd=ButterBandPass(fs,n,1000,3000);
out5=filter(hd,f);
res5=out5*10^(gains(5)/20);

hd=ButterBandPass(fs,n,3000,6000);
out6=filter(hd,f);
res6=out6*10^(gains(6)/20);

hd=ButterBandPass(fs,n,6000,12000);
out7=filter(hd,f);
res7=out7*10^(gains(7)/20);

hd=ButterBandPass(fs,n,12000,14000);
out8=filter(hd,f);
res8=out8*10^(gains(8)/20);

hd=ButterBandPass(fs,n,14000,16000);
out9=filter(hd,f);
res9=out9*10^(gains(9)/20);

fOut=res1+res2+res3+res4+res5+res6+res7+res8+res9;
