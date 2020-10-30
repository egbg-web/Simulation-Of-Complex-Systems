function [averageLength, diameter]=Path(graph,n)

distanceMatrix=zeros(size(graph,1));

for i=1:size(graph,1)
    b=graph^(i);
    [row column]=find(b>0);
    
    for j=1:length(row)
        if distanceMatrix(row(j),column(j))== 0
            distanceMatrix(row(j),column(j))=i;
        end
    end
end
for diagonal=1:size(graph,1)
    distanceMatrix(diagonal,diagonal)=0;
    
end

averageLength = sum(distanceMatrix,'all')./(n.*(n-1));
diameter=max(distanceMatrix,[],'all');

end

    
   