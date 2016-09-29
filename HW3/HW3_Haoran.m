load('LineData.mat');
load('AffineData.mat');
[a,b,d]=RansacFit( x, y, 100, 0.8, 0.5);
figure(1)
plot(x,-a/b*x-d/b,'LineWidth',4)
hold on
scatter(x,y)
hold off
% for e=0.5, N = 32 for p 0.9999

figure(2)
subplot(1,2,1)
scatter(orig_feature_pt(1,:),orig_feature_pt(2,:))
subplot(1,2,2)
scatter(trans_feature_pt(1,:),trans_feature_pt(2,:))


%Castle problem
Origin = imread('castle_original.png');
Transformed = imread('castle_transformed.png');
answ = RansacFind(orig_feature_pt, trans_feature_pt,50, 4, 0.7 );
tform = maketform('affine',[answ(1:3),answ(4:6),[0; 0; 1]]);
Trans = imtransform(Origin,tform);
figure(3)
imshowpair(Transformed,Trans,'montage')


%Cow problem
Cow = imread('cow.png');
Template = imread('template.png');
BW = edge(rgb2gray(Cow),'Canny');
figure(4)
imshow(BW);
[m,n] = size(BW);
disTrans = inf(m,n);
for i = 1:m
    for j = 1:n
        if BW(i,j)
            disTrans(i,j)= 0;
        end
    end
end

for i = 2:m
    for j = 2:n
        disTrans(i,j)= min(disTrans(i,j),min(disTrans(i-1,j),disTrans(i,j-1))+1);
    end
end
for i = m-1:-1:1
    for j = n-1:-1:1
        disTrans(i,j)= min(disTrans(i,j),min(disTrans(i+1,j),disTrans(i,j+1))+1);
    end
end
figure(5)
imshow(uint8(disTrans))

City = bwdist(BW,'cityblock');
Chess = bwdist(BW,'chessboard');
Euclidean = bwdist(BW,'euclidean');

figure(6)
subplot(1,3,1)
imshow(mat2gray(City))
subplot(1,3,2)
imshow(mat2gray(Chess))
subplot(1,3,3)
imshow(mat2gray(Euclidean))

[tm,tn]= size(Template);
ChamferDis = inf;
loc = [1,1];
for i=1:(m-tm)
    for j = 1:(n-tn)
        dis = sum(sum(disTrans(i:i+tm-1,j:j+tn-1).*Template));
        if ChamferDis > dis
            ChamferDis = dis;
            loc = [i,j];
        end
    end
end

for i= loc(1):loc(1)+tm-1
    for j=loc(2):loc(2)+tn-1
        if Template(i-loc(1)+1,j-loc(2)+1)
            Cow(i,j,1)=255;
            Cow(i,j,2)=255;
            Cow(i,j,3)=255;
        end
    end
end
figure(7)
imshow(Cow)
     



