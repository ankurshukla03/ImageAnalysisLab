% FFT cameraman
Cman = imread('images/cameraman.png');
Cman = double(Cman);


% 
%[rows, cols] = size(I3);
%result = uint8(zeros(rows, cols));
%for r = 1:rows
%    for c = 1:cols
%        result(r, c) = uint8(I3(r,c) < 0);
%    end
%end


I2 = fft2(Cman);
Img = fftshift(I2);
% 
% 
% for filters={'gaussian'}
%    idx = 1;
%    fname = filters{1};
%    for fsize=[3,7,31]
%       if (strcmp(fname,'gaussian'))
%           mFilter = fspecial(fname, fsize, fsize/2);
%       else
%           mFilter = fspecial(fname, fsize);
%       end
% 
%       Smooth_Img = imfilter(Img, mFilter, 'same');
%       Sharp_Img = Img + 0.5 * (Img - Smooth_Img);
% 
%       subplot(3,3,idx), imshow(Img);
%       subplot(3,3,idx + 1), imshow(Smooth_Img);
%       subplot(3,3,idx + 2), imshow(Sharp_Img);
%       title(fname);
%       
%       idx = idx + 3;
%    end
%    end

% 
% Img1 = ifft2(Img);
% imagesc(Img1);
 
%imagesc(I3);
%pause;
%imagesc(log(ifftshift(ifft2(result))));

