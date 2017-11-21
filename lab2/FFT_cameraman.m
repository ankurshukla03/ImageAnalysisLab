Img = imread('images/cameraman.png');
F_Img = fft2(double(I));
F_orig = fftshift(F_Img);

[rows, cols] = size(Img);
for r = 1:rows
    for c = 1:cols
        if abs(F_orig(r, c)) < 10000
            F_orig(r, c) = 0;
        end
    end
end

result = ifftshift(F_orig);
result = ifft2(result);

subplot(1,2,1); imagesc(Img);
subplot(1,2,2); imagesc(result);