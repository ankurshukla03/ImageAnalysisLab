O1 = fft2(rand(1,5));
E1 = fft2(rand(1,6));

O2 = fftshift(O1);
E2 = fftshift(E1);

O3 = ifftshift(O2);
O3 = ifft2(O3);

E3 = ifftshift(E2);
E3 = ifft2(E3);

O = [O1;O2;O3] ;
E = [E1;E2;E3] ;
O 
E