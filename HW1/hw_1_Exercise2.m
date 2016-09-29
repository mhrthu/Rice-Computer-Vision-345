close all;
barbara=imread('barbara.jpg');
imshow(barbara);
barbaragrey = rgb2gray(barbara);
figure(2);
imshow(barbaragrey);
gaussfilter = fspecial('gaussian', 5, 2);
convIm = imfilter(barbaragrey, gaussfilter, 'symmetric'); 
figure(3);
imshow(convIm);
subtract= barbaragrey - convIm;
figure(4);
imshow(subtract);
m = max(max(subtract));
threshold = 0.05*m;
tSub = subtract;
index = find(subtract<=threshold);  %% SEE 'help find'
tSub(index) =  0;
figure(5);
imshow(tSub);
figure(6);
subplot 121
imshow(subtract*10);
subplot 122
imshow(tSub*10);




