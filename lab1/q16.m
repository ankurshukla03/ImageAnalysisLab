img = imread('images/image.jpg');
g_img = rgb2gray(img);
px_count = size(g_img, 1) * size(g_img, 2);

freq  = zeros(256, 1); % frequency of each pixel value
probf = zeros(256, 1); % probability of each occurence
probc = zeros(256, 1); % cumulative probability
cum   = zeros(256, 1); % cumulative px
output= zeros(256, 1); % cum output

for i=1:size(g_img, 1)
  for j=1:size(g_img, 2)
    value=g_img(i, j);
    freq(value + 1) = freq(value + 1) + 1;
    probf(value + 1) = freq(value + 1) / px_count;
  end
end

sum=0;
no_bins=255;
hist_img=uint8(zeros(size(g_img,1),size(g_img,2)));

% The cumulative distribution probability is calculated.
for i=1:size(probf)
  sum = sum + freq(i);
  cum(i) = sum;
  probc(i) = cum(i) / px_count;
  output(i) = round(probc(i) * no_bins);
end

for i=1:size(g_img, 1)
  for j=1:size(g_img, 2)
    hist_img(i, j) = output(g_img(i, j) + 1);
  end
end

hist_img;
figure,
imshow(hist_img)
