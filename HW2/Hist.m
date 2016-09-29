function hist = Hist(source,Thigh, Tlow)
%do Hysteresis Thresholding here
hist = zeros(size(source));
index = find(source<Tlow);  
source(index) = 0;
[m,n]=size(source);
for i=1:m
    for j=1:n
        if source(i,j)>= Thigh
            hist(i,j) = 1;
        else if source(i,j)>= Tlow
                mem = source(i,j);
                source(i,j)=0; %to search for neighbours other than this pixel
                %search at 3*3
                cubemax = max(max(source(max(1,i-1):min(i+1,m),max(1,j-1):min(j+1,n))));
                if cubemax>=Thigh
                    hist(i,j) = 1;
                    
                else if cubemax>=Tlow
                        %search at 5*5
                        if max(max(source(max(1,i-2):min(i+2,m),max(1,j-2):min(j+2,n))))>=Thigh
                            hist(i,j) = 1;
                        end
                    end
                end
                source(i,j)=mem;
            end
        end
            
    end   
end

end

