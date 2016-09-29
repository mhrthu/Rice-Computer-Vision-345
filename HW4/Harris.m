function [Pts,Mc] = Harris( image, sigma, Threshold)
diffx = 0.5* [-1, 0, 1];
diffy = 0.5* [-1; 0; 1];
Ix = imfilter(image, diffx, 'symmetric');
Iy = imfilter(image, diffy, 'symmetric');
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
gauss = fspecial('gaussian', 4*sigma, sigma);
convIx2 = imfilter(Ix2, gauss, 'symmetric'); 
convIy2 = imfilter(Iy2, gauss, 'symmetric'); 
convIxy = imfilter(Ixy, gauss, 'symmetric'); 
detH = convIx2.*convIy2 - convIxy.*convIxy;
traceH = convIx2 + convIy2;
M = detH./traceH;
Mc=M;
M(isnan(M)) = 0;
Threshidx = M < Threshold;
M(Threshidx)=0;
Pts = imregionalmax(M);
Mpt = double(imregionalmax(M));
% imshow(Mpt);
imshow(uint8(Mpt*255+image));

end

