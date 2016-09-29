function result = setNaN(source)
a = size(source);
result = source;
for i = 1:a(1)
    for j = 1:a(2)
        if source(i,j)>(a(2)-j)||(source(i,j)+j)<1||abs(source(i,j))>25
           result(i,j)=NaN;
        end
        
    end
end
end