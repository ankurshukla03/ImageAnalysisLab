% FFT cameraman
Cman = imread('images/cameraman.png');
Cman = double(Cman);

I2 = fft2(Cman);
% I3 = fftshift(I2);
% I3 = abs(I3);
% I3 = log(I3);
% 
[rows, cols] = size(I3);
result = uint8(zeros(rows, cols));
for r = 1:rows
    for c = 1:cols
        result(r, c) = uint8(I3(r,c) < 0);
    end
end

imagesc(result);
pause;
imagesc(ifft2(result));