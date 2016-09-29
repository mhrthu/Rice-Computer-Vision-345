function pts = rand2Points(total)
%INDEX = RANDPOINTS(TOTAL)
%   randomly, non-repeatedly select 2 integers from 1:TOTAL

a=0;
b=0;
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
pts = [a,b];
end

