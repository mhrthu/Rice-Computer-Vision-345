function dismap = disparitymap(left, right, patchsize)
a = size(left);
dismap = NaN(a);
for i = 1:a(1)
    disp(i)
    for j = 1:a(2)
        loc = [i,j];
        subLeft = left(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),a(1)),...
            max(1,(loc(2)-patchsize/2)):min(a(2),(loc(2)+patchsize/2)));
        c = normxcorr2(subLeft,right(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),a(1)),:));
        linematch = c(patchsize+1,:);
        [dis,idx]=max(linematch);
        if dis>0.6
            disparity = loc(2)-idx+patchsize/2;
            if abs(disparity)>(a(2)/5)
                disparity = NaN;
            end
            dismap(i,j) = disparity;
        end
        
    end
end
end