load dip_hw_2.mat;

d_low_ideal1 = myLowPassIdealDir(50 , 500, 0 , 30);
d_low_ideal2 = myLowPassIdealDir(50 , 500, 30 , 30);
d_low_ideal3 = myLowPassIdealDir(50 , 500, 60 , 30);
d_low_ideal4 = myLowPassIdealDir(50 , 500, 90 , 30);
d_low_ideal5 = myLowPassIdealDir(50 , 500, 120 , 30);
d_low_ideal6 = myLowPassIdealDir(50 , 500, 150 , 30);
D_low_ideal = d_low_ideal1+d_low_ideal2+d_low_ideal3+d_low_ideal4+d_low_ideal5+d_low_ideal6;
[r,c]=find(D_low_ideal>1);
if size(r,1)~=0 ; D_low_ideal(r,c)=1; end

d_low_butter1 = myLowPassButterworthDir(50 ,5, 500, 0 , 30);
d_low_butter2 = myLowPassButterworthDir(50 ,5, 500, 30 , 30);
d_low_butter3 = myLowPassButterworthDir(50 ,5, 500, 60 , 30);
d_low_butter4 = myLowPassButterworthDir(50 ,5, 500, 90 , 30);
d_low_butter5 = myLowPassButterworthDir(50 ,5, 500, 120 , 30);
d_low_butter6 = myLowPassButterworthDir(50 ,5, 500, 150 , 30);
D_low_butter = d_low_butter1+d_low_butter2+d_low_butter3+d_low_butter4+d_low_butter5+d_low_butter6;
[r,c]=find(D_low_butter>1);
if size(r,1)~=0 ; D_low_butter(r,c)=1; end

d_low_gauss1 = myLowPassGaussDir(50 , 500, 0 , 30);
d_low_gauss2 = myLowPassGaussDir(50 , 500, 30 , 30);
d_low_gauss3 = myLowPassGaussDir(50 , 500, 60 , 30);
d_low_gauss4 = myLowPassGaussDir(50 , 500, 90 , 30);
d_low_gauss5 = myLowPassGaussDir(50 , 500, 120 , 30);
d_low_gauss6 = myLowPassGaussDir(50 , 500, 150 , 30);
D_low_gauss = d_low_gauss1+d_low_gauss2+d_low_gauss3+d_low_gauss4+d_low_gauss5+d_low_gauss6;
[r,c]=find(D_low_gauss>1);
if size(r,1)~=0 ; D_low_gauss(r,c)=1; end

d_high_ideal1 = myHighPassIdealDir(150 , 500, 0 , 30);
d_high_ideal2 = myHighPassIdealDir(150 , 500, 30 , 30);
d_high_ideal3 = myHighPassIdealDir(150 , 500, 60 , 30);
d_high_ideal4 = myHighPassIdealDir(150 , 500, 90 , 30);
d_high_ideal5 = myHighPassIdealDir(150 , 500, 120 , 30);
d_high_ideal6 = myHighPassIdealDir(150 , 500, 150 , 30);
D_high_ideal = d_high_ideal1+d_high_ideal2+d_high_ideal3+d_high_ideal4+d_high_ideal5+d_high_ideal6;
[r,c]=find(D_high_ideal>1);
if size(r,1)~=0 ; D_high_ideal(r,c)=1; end

d_high_butter1 = myHighPassButterworthDir(150 ,5, 500, 0 , 30);
d_high_butter2 = myHighPassButterworthDir(150 ,5, 500, 30 , 30);
d_high_butter3 = myHighPassButterworthDir(150 ,5, 500, 60 , 30);
d_high_butter4 = myHighPassButterworthDir(150 ,5, 500, 90 , 30);
d_high_butter5 = myHighPassButterworthDir(150 ,5, 500, 120 , 30);
d_high_butter6 = myHighPassButterworthDir(150 ,5, 500, 150 , 30);
D_high_butter = d_high_butter1+d_high_butter2+d_high_butter3+d_high_butter4+d_high_butter5+d_high_butter6;
[r,c]=find(D_high_butter>1);
if size(r,1)~=0 ; D_high_butter(r,c)=1; end

d_high_gauss1 = myHighPassGaussDir(150 , 500, 0 , 30);
d_high_gauss2 = myHighPassGaussDir(150 , 500, 30 , 30);
d_high_gauss3 = myHighPassGaussDir(150 , 500, 60 , 30);
d_high_gauss4 = myHighPassGaussDir(150 , 500, 90 , 30);
d_high_gauss5 = myHighPassGaussDir(150 , 500, 120 , 30);
d_high_gauss6 = myHighPassGaussDir(150 , 500, 150 , 30);
D_high_gauss = d_high_gauss1+d_high_gauss2+d_high_gauss3+d_high_gauss4+d_high_gauss5+d_high_gauss6;
[r,c]=find(D_high_gauss>1);
if size(r,1)~=0 ; D_high_gauss(r,c)=1; end

d_band_ideal1 = myBandPassIdealDir(50 ,150, 500, 0 , 30);
d_band_ideal2 = myBandPassIdealDir(50 ,150, 500, 30 , 30);
d_band_ideal3 = myBandPassIdealDir(50 ,150, 500, 60 , 30);
d_band_ideal4 = myBandPassIdealDir(50 ,150, 500, 90 , 30);
d_band_ideal5 = myBandPassIdealDir(50 ,150, 500, 120 , 30);
d_band_ideal6 = myBandPassIdealDir(50 ,150, 500, 150 , 30);
D_band_ideal = d_band_ideal1+d_band_ideal2+d_band_ideal3+d_band_ideal4+d_band_ideal5+d_band_ideal6;
[r,c]=find(D_band_ideal>1);
if size(r,1)~=0 ; D_band_ideal(r,c)=1; end

d_band_butter1 = myBandPassButterworthDir(50 ,150 ,5, 500, 0 , 30);
d_band_butter2 = myBandPassButterworthDir(50 ,150 ,5, 500, 30 , 30);
d_band_butter3 = myBandPassButterworthDir(50 ,150 ,5, 500, 60 , 30);
d_band_butter4 = myBandPassButterworthDir(50 ,150 ,5, 500, 90 , 30);
d_band_butter5 = myBandPassButterworthDir(50 ,150 ,5, 500, 120 , 30);
d_band_butter6 = myBandPassButterworthDir(50 ,150 ,5, 500, 150 , 30);
D_band_butter = d_band_butter1+d_band_butter2+d_band_butter3+d_band_butter4+d_band_butter5+d_band_butter6;
[r,c]=find(D_band_butter>1);
if size(r,1)~=0 ; D_band_butter(r,c)=1; end

d_band_gauss1 = myBandPassGaussDir(50 ,150 , 500, 0 , 30);
d_band_gauss2 = myBandPassGaussDir(50 ,150 , 500, 30 , 30);
d_band_gauss3 = myBandPassGaussDir(50 ,150 , 500, 60 , 30);
d_band_gauss4 = myBandPassGaussDir(50 ,150 , 500, 90 , 30);
d_band_gauss5 = myBandPassGaussDir(50 ,150 , 500, 120 , 30);
d_band_gauss6 = myBandPassGaussDir(50 ,150 , 500, 150 , 30);
D_band_gauss = d_band_gauss1+d_band_gauss2+d_band_gauss3+d_band_gauss4+d_band_gauss5+d_band_gauss6;
[r,c]=find(D_band_gauss>1);
if size(r,1)~=0 ; D_band_gauss(r,c)=1; end

ImOut_a1 = myFiltFreq(demo2Im1,D_low_ideal);
ImOut_a2 = myFiltFreq(demo2Im1,D_low_butter);
ImOut_a3 = myFiltFreq(demo2Im1,D_low_gauss);
ImOut_a4 = myFiltFreq(demo2Im1,D_high_ideal);
ImOut_a5 = myFiltFreq(demo2Im1,D_high_butter);
ImOut_a6 = myFiltFreq(demo2Im1,D_high_gauss);
ImOut_a7 = myFiltFreq(demo2Im1,D_band_ideal);
ImOut_a8 = myFiltFreq(demo2Im1,D_band_butter);
ImOut_a9 = myFiltFreq(demo2Im1,D_band_gauss);

ImOut_b1 = myFiltFreq(demo2Im2,D_low_ideal);
ImOut_b2 = myFiltFreq(demo2Im2,D_low_butter);
ImOut_b3 = myFiltFreq(demo2Im2,D_low_gauss);
ImOut_b4 = myFiltFreq(demo2Im2,D_high_ideal);
ImOut_b5 = myFiltFreq(demo2Im2,D_high_butter);
ImOut_b6 = myFiltFreq(demo2Im2,D_high_gauss);
ImOut_b7 = myFiltFreq(demo2Im2,D_band_ideal);
ImOut_b8 = myFiltFreq(demo2Im2,D_band_butter);
ImOut_b9 = myFiltFreq(demo2Im2,D_band_gauss);

figure(1)
imshow(ImOut_a1)
title('Dir Low Pass Ideal - image 1')
figure(2)
imshow(ImOut_a2)
title('Dir Low Pass Butterworth - image 1')
figure(3)
imshow(ImOut_a3)
title('Dir Low Pass Gauss - image 1')
figure(4)
imshow(ImOut_a4)
title('Dir High Pass Ideal - image 1')
figure(5)
imshow(ImOut_a5)
title('Dir High Pass Butterworth - image 1')
figure(6)
imshow(ImOut_a6)
title('Dir High Pass Gauss - image 1')
figure(7)
imshow(ImOut_a7)
title('Dir Band Pass Ideal - image 1')
figure(8)
imshow(ImOut_a8)
title('Dir Band Pass Butterworth - image 1')
figure(9)
imshow(ImOut_a9)
title('Dir Band Pass Gauss - image 1')

figure(10)
imshow(ImOut_b1)
title('Dir Low Pass Ideal - image 2')
figure(11)
imshow(ImOut_b2)
title('Dir Low Pass Butterworth - image 2')
figure(12)
imshow(ImOut_b3)
title('Dir Low Pass Gauss - image 2')
figure(13)
imshow(ImOut_b4)
title('Dir High Pass Ideal - image 2')
figure(14)
imshow(ImOut_b5)
title('Dir High Pass Butterworth - image 2')
figure(15)
imshow(ImOut_b6)
title('Dir High Pass Gauss - image 2')
figure(16)
imshow(ImOut_b7)
title('Dir Band Pass Ideal - image 2')
figure(17)
imshow(ImOut_b8)
title('Dir Band Pass Butterworth - image 2')
figure(18)
imshow(ImOut_b9)
title('Dir Band Pass Gauss - image 2')