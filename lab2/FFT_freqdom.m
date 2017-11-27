Img = imread('images/freqdist.png');
Img = double(Img);

F_Img = fft2(Img);
Fs_Img = fftshift(F);

[rows, cols] = size(Img);
for r = 1:rows
    for c = 1:cols
		if (abs(Fs_Img(r,c)) > 10^6)
			Fs_Img(r,c) = 0;
		end
    end
end

result = ifftshift(Fs_Img);
result = ifft2(result);

subplot(1,2,1), imagesc(Img);
subplot(1,2,2), imagesc(result);