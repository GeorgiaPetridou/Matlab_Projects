load dip_hw_2.mat;

f_low1 = myLowPassIdeal(50,500);
f_low2 = myLowPassButterworth(50,5,500);
f_low3 = myLowPassGauss(50,500);

f_high1 = myHighPassIdeal(150,500);
f_high2 = myHighPassButterworth(150,5,500);
f_high3 = myHighPassGauss(150,500);

f_band1 = myBandPassIdeal(50,150,500);
f_band2 = myBandPassButterworth(50,150,5,500);
f_band3 = myBandPassGauss(50,150,500);

ImOut_a1 = myFiltFreq(demo2Im1,f_low1);
ImOut_a2 = myFiltFreq(demo2Im1,f_low2);
ImOut_a3 = myFiltFreq(demo2Im1,f_low3);
ImOut_a4 = myFiltFreq(demo2Im1,f_high1);
ImOut_a5 = myFiltFreq(demo2Im1,f_high2);
ImOut_a6 = myFiltFreq(demo2Im1,f_high3);
ImOut_a7 = myFiltFreq(demo2Im1,f_band1);
ImOut_a8 = myFiltFreq(demo2Im1,f_band2);
ImOut_a9 = myFiltFreq(demo2Im1,f_band3);

ImOut_b1 = myFiltFreq(demo2Im2,f_low1);
ImOut_b2 = myFiltFreq(demo2Im2,f_low2);
ImOut_b3 = myFiltFreq(demo2Im2,f_low3);
ImOut_b4 = myFiltFreq(demo2Im2,f_high1);
ImOut_b5 = myFiltFreq(demo2Im2,f_high2);
ImOut_b6 = myFiltFreq(demo2Im2,f_high3);
ImOut_b7 = myFiltFreq(demo2Im2,f_band1);
ImOut_b8 = myFiltFreq(demo2Im2,f_band2);
ImOut_b9 = myFiltFreq(demo2Im2,f_band3);

figure(1)
imshow(ImOut_a1)
title('Low Pass Ideal - image 1')
figure(2)
imshow(ImOut_a2)
title('Low Pass Butterworth - image 1')
figure(3)
imshow(ImOut_a3)
title('Low Pass Gauss - image 1')
figure(4)
imshow(ImOut_a4)
title('High Pass Ideal - image 1')
figure(5)
imshow(ImOut_a5)
title('High Pass Butterworth - image 1')
figure(6)
imshow(ImOut_a6)
title('High Pass Gauss - image 1')
figure(7)
imshow(ImOut_a7)
title('Band Pass Ideal - image 1')
figure(8)
imshow(ImOut_a8)
title('Band Pass Butterworth - image 1')
figure(9)
imshow(ImOut_a9)
title('Band Pass Gauss - image 1')

figure(10)
imshow(ImOut_b1)
title('Low Pass Ideal - image 2')
figure(11)
imshow(ImOut_b2)
title('Low Pass Butterworth - image 2')
figure(12)
imshow(ImOut_b3)
title('Low Pass Gauss - image 2')
figure(13)
imshow(ImOut_b4)
title('High Pass Ideal - image 2')
figure(14)
imshow(ImOut_b5)
title('High Pass Butterworth - image 2')
figure(15)
imshow(ImOut_b6)
title('High Pass Gauss - image 2')
figure(16)
imshow(ImOut_b7)
title('Band Pass Ideal - image 2')
figure(17)
imshow(ImOut_b8)
title('Band Pass Butterworth - image 2')
figure(18)
imshow(ImOut_b9)
title('Band Pass Gauss - image 2')


