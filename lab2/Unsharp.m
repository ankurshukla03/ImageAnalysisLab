Img = imread('images/cameraman.png');
Img = double(Img);

H = fspecial('unsharp');
sharpened = imfilter(Img,H);

imshow(sharpened);