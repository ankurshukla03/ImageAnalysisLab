rows = 2;
cols = 3;

I = imread('data/hand.pnm');

figure(1);
subplot(rows, cols, 1); imshow(I);
% Separate the three layers, RGB
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
subplot(rows, cols, 2); plot3(R(:),G(:),B(:),'.')

label_im = imread('data/hand_training.png');

subplot(rows, cols, 3); imagesc(label_im);

% Create an image with two bands/features 
I3(:,:,3) = R; 
I3(:,:,2) = B;
I3(:,:,1) = G; 
% Arrange the training data into vectors 
[data,class] = create_training_data(I3,label_im);
subplot(rows, cols, 4); scatterplot3D(data,class);

Itest = im2testdata(I3); % Reshape the image before classification
C = classify(double(Itest),double(data),double(class)); % Train classifier and classify the data
ImC = class2im(C,size(I3,1),size(I3,2)); % Reshape the classification to an image
subplot(rows,cols, 5);imagesc(ImC);