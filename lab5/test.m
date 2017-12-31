clearvars;

Img = imread('imagedata/train_0070.png'); % 012
% Img = imread('imagedata/train_1157.png'); % 012
% Img = imread('imagedata/train_1153.png'); % 210
% Img = imread('imagedata/train_1154.png'); % 112
% Img = imread('imagedata/train_1089.png'); % 102

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
    coord = size(nums{1});
    w = coord(1);
    h = coord(2);
    % split the bounding box into 3
    nums{2} = imcrop(nums{1}, [w/3,    1, w/3*2, h]);
    nums{3} = imcrop(nums{1}, [w/3 * 2 1, w    , h]);
    % third the size of 1
    nums{1} = imcrop(nums{1}, [1,      1, w/3  , h]);
elseif (length(nums) == 2)
    % split the box into 2
    coord = size(nums{2});
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
    tmp = ~~nums{i};
    tProps = regionprops(tmp, 'Orientation');
    E = tProps.Orientation;
    % E
    if (E > 88)
        ret(i) = 0;
    elseif (E < 0)
        ret(i) = 1;
    else
        ret(i)=2;
    end
end

ret
