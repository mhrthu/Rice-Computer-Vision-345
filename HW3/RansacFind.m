%function result = RansacFind(Source, Result,SampleNum, distanceTh, inlinerratio )
function parameter = RansacFind(Source, Result,SampleNum, distanceTh, inlinerratio )

%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
totalPts = length(Source);
Thinliner = round(inlinerratio .* totalPts);
result = zeros(7,SampleNum);

for i = 1:SampleNum
    pts = rand3Points(totalPts);
    A =[Source(:,pts(1)).',1,0,0,0;
        0,0,0,Source(:,pts(1)).',1;
        Source(:,pts(2)).',1,0,0,0;
        0,0,0,Source(:,pts(2)).',1;
        Source(:,pts(3)).',1,0,0,0;
        0,0,0,Source(:,pts(3)).',1];
    B =[Result(:,pts(1)).',Result(:,pts(2)).',Result(:,pts(3)).'];
    X = A\B'; % result for one set of parameters
    dis = abs(Source(1,:)*X(1)+Source(2,:)*X(2)+X(3)-Result(1,:))+abs(Source(1,:)*X(4)+Source(2,:)*X(5)+X(6)-Result(2,:));
    inliners = find(abs(dis) < distanceTh);
    inlrnum = length(inliners);
    if inlrnum > Thinliner
        result(:,i)= [X;inlrnum];
    end
end
[a,idx] = max(result(7,:));
index = find(result(7,:)==a);
parameter = mean(result(1:6,index),2); %#ok<FNDSB>
%parameter = transpose(result(1:6,idx));
end

