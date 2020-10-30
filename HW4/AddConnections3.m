function adjacencyNew = AddConnections3(adjacency,m)

degree=sum(adjacency);
sumOfDegree=sum(degree);
probabilities=degree/sumOfDegree;
index=1:length(degree);

choosenIndex=zeros(1,m);

for i=1:m
    
    choosenIndex(i)=randsample(index,1,true,probabilities);
    indexNotRepeat=find(index==choosenIndex(i));
    index(indexNotRepeat)=[];
    probabilities(indexNotRepeat)=[];
    
end

%lägg till nya connections/updatera matris genom att addera rad/kolonn

adjacency=[adjacency zeros(length(degree),1)];
adjacency(choosenIndex,length(degree)+1)=1;

adjacency=[adjacency; zeros(1,length(degree)+1)];
adjacency(length(degree)+1,choosenIndex)=1;
adjacencyNew=adjacency;

end