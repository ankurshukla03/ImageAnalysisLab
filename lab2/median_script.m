% Median filter

Img = imread('images/wagon_shot_noise.png');
Img = uint8(Img)

idx = 1
for fsize=[3,5,9]
  Med_Img = medfilt2(Img, [fsize fsize]);
  MMed_Img = myMedian(Img);
  
  subplot(3,3,idx), imshow(Img);
  subplot(3,3,idx + 1), imshow(Med_Img);
  subplot(3,3,idx + 2), imshow(MMed_Img);

  idx = idx + 3
end