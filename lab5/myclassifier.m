function S = myclassifier(im)

%This classifier is not state of the art... but should give you an idea of
%the format we expect to make it easy to keep track of your scores. Input
%is the image, output is a 1 x 3 vector of the three numbers in the image
%
%This baseline classifier tries to guess... so should score about (3^3)^-1
%on average, approx. a 4% chance of guessing the correct answer. 
%
Img = im;

thresh = 0.2;
Img = ~im2bw(Img, thresh);

% mean filter
Img = imfilter(Img, ones(5,5)./(5^2));

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
    if (E > 88)
        ret(i) = 0;
    elseif (E < 0)
        ret(i) = 1;
    else
        ret(i)=2;
    end
end

S = ret(1:3);
end

