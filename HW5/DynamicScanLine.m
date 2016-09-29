
left=double(rgb2gray(imread('tsukuba_l.ppm')));
right=double(rgb2gray(imread('tsukuba_r.ppm')));
P =[136,83;203,304;182,119;186,160;123,224;153,338];
patchsize = 16;
DyMap = DynamicMap(left,right,patchsize);
figure(4)
imshow(uint8(DyMap*7));


