% Segmentation

% read image
Img = imread('bacteria.tif');

% mean filter before more processing

Img = imfilter(Img,[1 1 1; 1 1 1; 1 1 1]./9);

% get threshold for grayscale
thresh = graythresh(Img);
Bw_Img = imbinarize(Img, thresh);

Dist_Img = bwdist(~Bw_Img, 'chessboard');
% complement
Dist_Img = -Dist_Img;
Dist_Img(~Bw_Img) = Inf;

% watershed
Ws_Img = watershed(Dist_Img);
% Ws_Img(~Bw_Img) = 0;

% label segments
Lb_Img = bwlabel(Ws_Img, 4);

prop='Area';
F = regionprops(Lb_Img, prop);

rows = 2;
cols = 3;
% row 1
subplot(rows,cols,1), imshow(Img);
subplot(rows,cols,2), imshow(Dist_Img);
subplot(rows,cols,3), imshow(Lb_Img);

% row 2
% histogram = getfield(F, prop);
subplot(rows,cols,4), hist([F.Area]);
