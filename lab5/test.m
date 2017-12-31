Img = imread('imagedata/train_1199.png');

thresh = graythresh(Img);
Img = im2bw(Img, thresh);

% mean filter
Img = imfilter(Img, ones(5,5)./25);

% close elements
Img = bwmorph(Img, 'close');

Dist_Img = bwdist(~Img);
Dist_Img = -Dist_Img;

Ws_Img = watershed(Dist_Img);
Ws_Img(~Img) = 0;

Lb_Img = bwlabel(Ws_Img,8);

rows = 1;
cols = 4;
subplot(rows,cols,1), imshow(Img);
subplot(rows,cols,2), imagesc(Dist_Img);
subplot(rows,cols,3), imshow(label2rgb(Ws_Img, 'spring'));
subplot(rows,cols,4), imshow(label2rgb(Lb_Img, 'spring'));

