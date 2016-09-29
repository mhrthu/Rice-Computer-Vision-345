function dismap = DynamicMap(left, right, patchsize)
dismap = NaN(size(left));
dim = size(left);
for i = 1:dim(1)
    disp(i)
    dismap(i,:)= DynamicLine(left,right,patchsize,i,dim);
end
end
