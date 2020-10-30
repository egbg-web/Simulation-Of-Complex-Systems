function distribution = GenerateDistribution3(adjacency)

degree=sum(adjacency);
numberOfNodes=size(adjacency,1);
nodesWithDegree=zeros(numberOfNodes,1);
j=0;

for i=0:numberOfNodes-1
    j=j+1;
    nodesWithDegree(j,1)=nnz(degree==i); %nnz =nr of nonzero matrix element
end

distribution=nodesWithDegree/sum(nodesWithDegree);

end