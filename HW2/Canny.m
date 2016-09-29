base = rgb2gray(imread('lena_std.tiff'));
NoiseReduction = 1/159 * [2 4 5 4 2;
    4 9 12 9 4;
    5 12 15 12 5;
    4 9 12 9 4;
    2 4 5 4 2];
baseNR= imfilter(base, NoiseReduction, 'symmetric'); 
figure(1);
imshow(base);
figure(2);
imshow(baseNR);
%Noise reduced
Dx=[-1 0 1; -2 0 2; -1 0 1];
Dy=[1 2 1; 0 0 0; -1 -2 -1];
baseDx = imfilter(double(base), Dx, 'symmetric'); 
baseDy = imfilter(double(base), Dy, 'symmetric'); 
figure(3);
subplot 121
imshow(uint8(baseDx));
subplot 122
imshow(uint8(baseDy));
figure(4)
baseD2 =double(baseDx).^2 + double(baseDy).^2;
baseD =baseD2.^0.5;
imshow(uint8(baseD));
baseTheta = atan(double(baseDy)./double(baseDx));
baseTheta360 = baseTheta/2/pi*360;
baseThetaR180 = (1-floor((baseTheta360+180)/180))*180+baseTheta360;
%round to 180
baseTRound = round(baseThetaR180./45)*45;
index = find(baseTRound==180);  %get rid of 180 in a nasty way :)
baseTRound(index) = 0;
edge = Edge(baseD,baseTRound); %Non Maximum supression
figure(5);
imshow(uint8(edge)); 
Thigh= max(max(edge))*0.2; %high threshold
Tlow = Thigh*0.4;  %Low threshold
histTh = Hist(edge, Thigh, Tlow); %Hysteresis Thresholding
figure(6);
imshow(histTh); 
imwrite(histTh,'Cannylena.png');





