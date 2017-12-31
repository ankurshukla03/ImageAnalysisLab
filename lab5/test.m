clearvars;
Img = imread('imagedata/train_0582.png');

thresh = 0.2; %graythresh(Img);
Img = ~im2bw(Img, thresh);

% mean filter
Img = imfilter(Img, ones(5,5)./(5^2));

Dist_Img = bwdist(~Img);
Dist_Img = -Dist_Img;

Lb_Img = bwlabel(Img);

rows = 1;
cols = 3;
subplot(rows,cols,1), imshow(Img);
subplot(rows,cols,2), imagesc(Dist_Img);
subplot(rows,cols,3), imshow(label2rgb(Lb_Img, 'spring'));

