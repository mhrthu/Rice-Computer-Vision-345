tiger=imread('tiger.jpg');
imSize = size(tiger)	      
% pause;  
imshow(tiger); axis on;
impixelinfo;
% pause
tigerhead = tiger(300:500,150:360,:);
figure(2);
imshow(tigerhead);
axis on;
impixelinfo;
imwrite(tigerhead,'tigerhead.png');
tigerheadred=tigerhead;
tigerheadred(:,:,2:3)=0;
figure(3);
imshow(tigerheadred);
%swtich R with G
R=tiger(:,:,1);
tiger(:,:,1)=tiger(:,:,2);
tiger(:,:,2)=R;
figure(4);
imshow(tiger);
pause;
clear all;
close all;

