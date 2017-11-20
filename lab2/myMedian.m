% My Median Filter, size 3
function result = myMedian(Img)
    [rows, cols] = size(Img);
    result = uint8(zeros(rows, cols));
    for r = 2:rows-2
        for c = 2:cols-2
            K = Img(r-1:r+1, c-1:c+1);
            result(r, c) = median(K(:));
        end
    end
end