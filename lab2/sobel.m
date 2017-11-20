function result = sobel(Img)
  mFilter = fspecial('sobel');
  result = imfilter(Img, mFilter, 'same');
end