function pts = rand3Points(total)
%INDEX = RANDPOINTS(TOTAL)
%   randomly, non-repeatedly select 2 integers from 1:TOTAL

a=0;
b=0;
c=0;
while a == 0
    a = ceil(rand(1,1)*total);
end
b = ceil(rand(1).*total);
while b==a
    b = ceil(rand(1).*total);
    while b == 0
    b = ceil(rand(1).*total);
    end
end
c = ceil(rand(1).*total);
while c==a||c==b 
    c = ceil(rand(1).*total);
    while c == 0
    c = ceil(rand(1).*total);
    end
end
pts = [a,b,c];
end
