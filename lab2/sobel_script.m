% sobel script

Cman = imread('images/cameraman.png');
Wagon = imread('images/wagon.png');

Cman = uint8(Cman);
Wagon = uint8(Wagon);

S_Cman = sobel(Cman);
S_Wag = sobel(Wagon);

subplot(2,2,1), imshow(Cman);
subplot(2,2,2), imshow(S_Cman);

subplot(2,2,3), imshow(Wagon);
subplot(2,2,4), imshow(S_Wag);