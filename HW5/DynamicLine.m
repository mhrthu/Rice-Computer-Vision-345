function disline = DynamicLine(left, right, patchsize, linenumber, dim)
disline = zeros(1,dim(2));
dismap = NaN(dim(2));%square matrix with size of the scanline
for j = 1:dim(2) %get the matrix ready
    loc = [linenumber,j];
    subLeft = left(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),dim(1)),...
        max(1,(loc(2)-patchsize/2)):min(dim(2),(loc(2)+patchsize/2)));
    c = normxcorr2(subLeft,right(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),dim(1)),:));
    dismap(j,:)= c(patchsize+1,patchsize/2+1:dim(2)+patchsize/2);
end
%disp(dismap);

%dynamical programing
pathmap = zeros(dim(2));
for j = 2:dim(2)
    pathmap(1,j)= pathmap(1,j-1)+dismap(1,j);
    pathmap(j,1)= pathmap(j-1,1)+dismap(1,j);
end
for i = 2:dim(2)
    for j = 2:dim(2)
        pathmap(i,j) = max([pathmap(i-1,j),pathmap(i-1,j-1),pathmap(i,j-1)])+dismap(i,j);
    end
end
%disp(pathmap);
idx = dim(2);
disline(idx)=0;
j=dim(2);
while j>1
%    disp(idx)
    if idx==1
        disline(j-1)=j-1;
        j=j-1;
    else
        [~,id] = max([pathmap(j,idx-1),pathmap(j-1,idx),pathmap(j-1,idx-1)]);
        switch id
            case 1
%                 if j ~=dim(2)
%                 disline(j)=disline(j)-1;
%                 end
                idx = idx-1;
            case 2
                disline(j-1)=j-idx+1;
                j=j-1;
            otherwise
                disline(j-1)=j-idx;
                j=j-1;
                idx=idx-1;
        end
%         if pathmap(j,idx-1)>pathmap(j-1,idx)
%             idx = idx-(pathmap(j,idx-1)~=pathmap(j,idx))*1;
%             disline(j) = j-idx;
%        end
    end
end
