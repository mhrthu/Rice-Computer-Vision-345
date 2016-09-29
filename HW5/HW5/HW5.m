left=double(rgb2gray(imread('tsukuba_l.ppm')));
right=double(rgb2gray(imread('tsukuba_r.ppm')));
gauss = fspecial('gaussian', 8, 2);
sleft= imfilter(left, gauss, 'symmetric'); 
sright= imfilter(right, gauss, 'symmetric'); 
P =[136,83;203,304;182,119;186,160;123,224;153,338];
patchsize = 30;
loc = P(6,:);
%get the line match function value
figure(1);
line = Match(loc,left, right,patchsize);
figure(2);
plot(line)
h = vline(loc(1),'r','Previous location');
%disparityMap = disparity(uint8(left),uint8(right),'Block size',30)
dismap = setNaN(disparitymap(left,right,30));
InterpolatedDismap = inpaint(dismap);
figure(3)
imshow(uint8(InterpolatedDismap));



