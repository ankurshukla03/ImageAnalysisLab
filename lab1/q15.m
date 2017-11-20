I1 = imread('images/image.jpg');
I2 = rgb2gray(I1);
I2 = imresize(I2,[128,128]);%original image
origGray = I2;

%this loop will generate filtered imaghe
fsize = 5;
[rows, cols] = size(I2);
res = zeros(rows, cols);
start =  mod(rows, fsize);
offset = fsize - start; %offset depends on stride size, wow
for r = start:rows-start
    mean = 0;
    for c = start:cols-start
        res(r, c) = mean2(I2(r-offset:r+offset, c-offset:c+offset));
    end
end

imshow(res,[])
origGray = double(origGray)
%imshow(res-origGray, [])