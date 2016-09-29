close all;
lena=imread('lena_noisy.png');
two = ones(2)/4;
four = ones(4)/16;
eight = ones(8)/64;
sixteen = ones(16)/(16^2);
figure(1);
subplot 221
conv2 = imfilter(lena, two, 'symmetric'); 
imshow(conv2)
title('2by2');
subplot 222
conv4 = imfilter(lena, four, 'symmetric'); 
imshow(conv4);
title('4by4');
subplot 223
conv8 = imfilter(lena, eight, 'symmetric'); 
imshow(conv8)
title('8by8');
subplot 224
conv16 = imfilter(lena, sixteen, 'symmetric'); 
imshow(conv16);
title('16by16');
suptitle('Averaging box filter');



figure(2);
gauss2 = fspecial('gaussian', 8, 2);
gauss4 = fspecial('gaussian', 16, 4);
gauss8 = fspecial('gaussian', 32, 8);
gauss16 = fspecial('gaussian', 64, 16);
subplot 221
conv2 = imfilter(lena, gauss2, 'symmetric'); 
imshow(conv2)
title('stddiv = 2');
subplot 222
conv4 = imfilter(lena, gauss4, 'symmetric'); 
imshow(conv4);
title('stddiv = 4');
subplot 223
conv8 = imfilter(lena, gauss8, 'symmetric'); 
imshow(conv8)
title('stddiv = 8');
subplot 224
conv16 = imfilter(lena, gauss16, 'symmetric'); 
imshow(conv16);
title('stddiv = 16');
suptitle('Gauss filter');











