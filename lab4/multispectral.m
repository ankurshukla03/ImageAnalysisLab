load data/landsat_data
figure(1);

subplot(2,2,1); imshow(landsat_data(:,:,[4,1,2])./255);
title('4,1,2');

subplot(2,2,2); imshow(landsat_data(:,:,[4,1,3])./255);
title('4,1,3');

subplot(2,2,3); imshow(landsat_data(:,:,[4,1,5])./255);
title('4,1,5');

subplot(2,2,4); imshow(landsat_data(:,:,[6,2,7])./255);
title('6,2,7');
