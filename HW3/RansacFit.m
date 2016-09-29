function [ a, b, d] = RansacFit( x, y, SampleNum, distanceTh, inlinerratio  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

totalPts = size(x);
Thinliner = round(inlinerratio .* totalPts);
result = zeros(4,SampleNum);

for i = 1:SampleNum
    pts = rand2Points(totalPts);
    slope = (y(pts(2))-y(pts(1)))/(x(pts(2))-x(pts(1)));
    theta = atan(slope);
    %using ax+by=d
    a = sin(theta);
    b = -cos(theta);
    d = a*x(pts(1))+b*y(pts(1));
    %count inliners
    dis = a*x+b*y-d;
    inliners = find(abs(dis) < distanceTh);
    inlrnum = length(inliners);
    if inlrnum > Thinliner
        %now refit with inliners
        p =polyfit(x(inliners),y(inliners),1);
        a = p(1)./(1+p(1).^2).^0.5;
        b = -1./(1+p(1).^2).^0.5;
        d = p(2)./(1+p(1).^2).^0.5;
        out = [a;b;d;inlrnum];
        result(:,i)=out;
    end

end
[~,idx] = max(result(4,:));
a = result(1,idx);
b = result(2,idx);
d = result(3,idx);

end

