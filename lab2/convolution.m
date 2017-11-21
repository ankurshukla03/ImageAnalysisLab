% convolution

Img = imread('images/cameraman.png');
Img = double(Img);

for filters={'gaussian','average','disk'}
   idx = 1;
   fname = filters{1};
   for fsize=[3,7,31]
      if (strcmp(fname,'gaussian'))
          mFilter = fspecial(fname, fsize, fsize/2);
      else
          mFilter = fspecial(fname, fsize);
      end

      Smooth_Img = imfilter(Img, mFilter, 'same');
      Sharp_Img = Img + fsize^2 * (Img - Smooth_Img);

      subplot(3,3,idx), imagesc(Img);
      subplot(3,3,idx + 1), imagesc(Smooth_Img);
      subplot(3,3,idx + 2), imagesc(Sharp_Img);
      title(fname);
      
      idx = idx + 3;
   end
   if (~strcmp(fname,'disk'))
       pause;
   end
end