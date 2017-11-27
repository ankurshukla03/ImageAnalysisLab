% Segmentation

% read image
Img = imread('bacteria.tif');
% Img = imread('coins.tif');
% Img = Img(1:200,101:300); %smaller image, 14 coins

% mean filter, clean noise
Img = imfilter(Img,[1 1 1; 1 1 1; 1 1 1]./9);

% get threshold for grayscale
thresh = .3; %graythresh(Img);
Bw_Img = ~im2bw(Img, thresh);

% close holes 
Bw_Img = bwmorph(Bw_Img, 'close');

% distance
Dist_Img = bwdist(~Bw_Img);
Dist_Img = imfilter(Dist_Img,[1 1 1; 1 1 1; 1 1 1]./9);

% complement
Dist_Img = -Dist_Img;
Dist_Img(~Bw_Img) = -Inf;

% watershed
Ws_Img = watershed(Dist_Img);
% Ws_Img(~Bw_Img) = 0;

% label segments
Lb_Img = Ws_Img; % bwlabel(Ws_Img);

% abstract property name
prop='Area';
F = regionprops(Lb_Img, prop, 'Centroid');

rows = 2;
cols = 3;
% _____________ row 1
subplot(rows,cols,1), imshow(Img);
subplot(rows,cols,2), imshow(Dist_Img);
subplot(rows,cols,3), imshow(label2rgb(Ws_Img, 'spring'));

% _____________ row 2

% label regions
% for each centroid, put a label there.
subplot(rows,cols,4), imshow(Img);
hold on
for k = 1:numel(F)
    text(F(k).Centroid(1), F(k).Centroid(2), num2str(k), ...
        'Color', 'r', 'HorizontalAlignment', 'center')
end
hold off

% histogram
fname = fieldnames(F); % keeping the property name abstract
regions = [ F.Area ];
% for i = 1:length(regions)
%    if regions(i) > 10
%        regions(i);
%    end
% end
subplot(rows,cols,5), hist(regions(2:end), 20);



