I = imread('data/handBW.pnm');
b = multithresh(I,2);
seqI=imquantize(I, b);
I2 = label2rgb(seqI);
imshow(I2);