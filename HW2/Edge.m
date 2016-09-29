function edge = Edge(baseD,theta)
%Non Maximum supression
[m,n]=size(baseD); %size of the image
edge = baseD; %initialize
    for i=2:m-1
        for j=2:n-1
            if(isnan(theta(i,j))==0) %is a number
               switch theta(i,j)
                case 0
                    if (baseD(i,j)~=max(baseD(i,j),baseD(i,j+1)) || baseD(i,j)~=max(baseD(i,j),baseD(i,j-1)))
                        edge(i,j)=0;
                    end
                    
                case 45
                    if (baseD(i,j)~=max(baseD(i,j),baseD(i+1,j-1)) || baseD(i,j)~=max(baseD(i,j),baseD(i-1,j+1)))
                        edge(i,j)=0;
                    end
               
                case 90
                     if (baseD(i,j)~=max(baseD(i,j),baseD(i+1,j)) || baseD(i,j)~=max(baseD(i,j),baseD(i-1,j)))
                        edge(i,j)=0;
                    end
              
                case 135
                     if (baseD(i,j)~=max(baseD(i,j),baseD(i+1,j+1)) || baseD(i,j)~=max(baseD(i,j),baseD(i-1,j-1)))
                        edge(i,j)=0;
                    end
                end
            end
        end
    end
end

