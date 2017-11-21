Img = imread('images/cameraman.png');
Img = double(Img);

F_Img = fft2(double(I));
Fs_Img = fftshift(F_Img);

[rows, cols] = size(Img);
for r = 1:rows
    for c = 1:cols
        if abs(Fs_Img(r, c)) < 10000
            Fs_Img(r, c) = 0;
        end
    end
end

result = ifftshift(Fs_Img);
result = ifft2(result);

subplot(1,2,1); imagesc(Img);
subplot(1,2,2); imagesc(result);