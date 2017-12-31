clearvars;
Img = imread('imagedata/train_1177.png');


thresh = 0.2; %graythresh(Img);
Img = ~im2bw(Img, thresh);

% mean filter
Img = imfilter(Img, ones(5,5)./(5^2));

% Dist_Img = bwdist(~Img);
% Dist_Img = -Dist_Img;

Lb_Img = bwlabel(Img);
Comps = bwconncomp(Lb_Img);
props = regionprops(Comps,'BoundingBox');

nums = {};
for i=1:numel(props)
    nums{i} = imcrop(Lb_Img, props(i).BoundingBox);
end

if (length(nums) == 1)
    coord = size(nums{1})
    w = coord(1)
    h = coord(2)
    % split the bounding box into 3
    nums{2} = imcrop(nums{1}, [w/3,    1, w/3*2, h]);
    nums{3} = imcrop(nums{1}, [w/3 * 2 1, w    , h]);
    % third the size of 1
    nums{1} = imcrop(nums{1}, [1,      1, w/3  , h]);
elseif (length(nums) == 2)
    % split the box into 2
    coord = size(nums{2})
    w = coord(1);
    h = coord(2);
    nums{3} = imcrop(nums{2}, [w/2, 1, w,   h]);
    % half the size of 2
    nums{2} = imcrop(nums{2}, [1,   1, w/2, h]);
elseif (length(nums) > 3)
    % oh no
    'more than three!?';
end

ret = [3,3,3];
for i=1:length(nums)
    % 1 | 2
    % -----
    % 3 | 4
    tmp = ~~nums{i};
    I1=sum(sum(tmp(1:size(tmp,1)/2,1:size(tmp,2)/2)));
    I2=sum(sum(tmp(size(tmp,1)/2+1:size(tmp,1),1:size(tmp,2)/2)));
    I3=sum(sum(tmp(1:size(tmp,1)/2,size(tmp,2)/2+1:size(tmp,2))));
    I4=sum(sum(tmp(size(tmp,1)/2+1:size(tmp,1),size(tmp,2)/2+1:size(tmp,2))));
    if (I1+I3 > I2 +I4)
        ret(i) = 1;
    elseif ((I2 + I3) > (I1 + I4))
        ret(i)=2;
    else
        ret(i)=0;
    end
end

ret
 
% rows = 1;
% cols = 3;
% subplot(rows,cols,1), imshow(Img);
% subplot(rows,cols,2), imagesc(Dist_Img);
% subplot(rows,cols,3), imshow(label2rgb(Lb_Img, 'spring'));
