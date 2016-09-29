function line = Match( loc,left, right, patchsize)
a = size(left);
subLeft = left(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),a(1)),...
    max(1,(loc(2)-patchsize/2)):min(a(2),(loc(2)+patchsize/2)));
c = normxcorr2(subLeft,right(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),a(1)),:));
linematch = c(patchsize,:);
[~,idx]=max(linematch);
subRight = right(max((loc(1)-patchsize/2),1):min((loc(1)+patchsize/2),a(1)),...
    max(1,idx-patchsize):min(a(2),(idx)));
imshowpair(subLeft,subRight,'montage');
line = [NaN(1,patchsize/2),c(patchsize,:)];


end