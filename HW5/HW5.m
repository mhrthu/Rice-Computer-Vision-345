
%Running the entire thing will take really really long !
left=double(rgb2gray(imread('tsukuba_l.ppm')));
right=double(rgb2gray(imread('tsukuba_r.ppm')));
P =[136,83;203,304;182,119;186,160;123,224;153,338];
patchsize = 16;
loc = P(5,:);
%get the line match function value
figure(1);
line = Match(loc,left,right,patchsize);
figure(2);
plot(line);
h = vline(loc(2),'r','Previous location');
%disparityMap = disparity(uint8(left),uint8(right),'BlockSize',7);
dismap = disparitymap(left,right,30);
dismap = setNaN(dismap);
 InterpolatedDismap = inpaint_nans(dismap,2);
 figure(3)
 imshow(uint8(InterpolatedDismap*7));
DyMap = DynamicMap(left,right,30);
figure(4)
imshow(uint8(DyMap*7));


