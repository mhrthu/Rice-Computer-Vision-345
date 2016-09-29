base = rgb2gray(imread('barbara.jpg'));
sobel = fspecial('sobel');
mean = 1/9 * [1 1 1; 1 1 1; 1 1 1];
diffx = 0.5* [-1, 0, 1];
diffy = 0.5* [-1; 0; 1];

baseSobel= imfilter(base, sobel, 'symmetric'); 
baseMean = imfilter(base, mean, 'symmetric');
basediffx = imfilter(base, diffx, 'symmetric');
basediffy = imfilter(base, diffy, 'symmetric');
baseCentraldiff = basediffy.^2+basediffx.^2;
baseMedian = medfilt2(base);

figure(2);
imshow(baseSobel);
figure(3);
imshow(baseMean);
figure(4);
imshow(baseMedian);
figure(1);
imshow(basediffy.^2+basediffx.^2);


