chess = double(rgb2gray(imread('chessboard.jpg')));
figure(1);
[Pts,Mc]=Harris(chess, 3,150);
chessrotate = imrotate(chess,30);
idx = chessrotate==0;
chessrotate(idx) = 255;
figure(2);
[R,A] = Harris(chessrotate, 5,200);
figure(3);
imshow(R);
chess4 = imresize(chess,4);
figure(4);
[B,M] = Harris(chess4, 8,30);
% figure(5);
% mask = ones(3); mask(5) = 0 % 3x3 max
% X = ordfilt2(M,8,mask);
% peaks = M > X;
% imshow(imextendedmax(M,1));





