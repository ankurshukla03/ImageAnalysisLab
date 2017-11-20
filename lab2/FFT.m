 I = imread('rectangle.png');
 I2 = double(I);
 
 p=1
 I2 = fft2(I2);
 I3 = fftshift(I2);
 I3 = abs(I3);
 I3 = log(I3);
 %imagesc(I3);
 subplot(2,2,p),imagesc(I);
 subplot(2,2,p+1),imagesc(I3);