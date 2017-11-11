% convolution

Img = imread('images/cameraman.png');
Img = uint8(Img)

idx = 1
for fsize=[3,7,31]
  mFilter = fspecial('gaussian', fsize, fsize/2);
  % mFilter = fspecial('average', fsize);
  % mFilter = fspecial('disk', fsize);

  Smooth_Img = imfilter(Img, mFilter, 'same');
  Sharp_Img = Img + fsize^2 * (Img - Smooth_Img);

  subplot(3,3,idx), imshow(Img);
  subplot(3,3,idx + 1), imshow(Smooth_Img);
  subplot(3,3,idx + 2), imshow(Sharp_Img);

  idx = idx + 3
end