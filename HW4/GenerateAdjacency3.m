function adjacency = GenerateAdjacency3(numberOfNodes)

adjacency=ones(numberOfNodes).*(ones(numberOfNodes)-eye(numberOfNodes));


end
















% function adjacency = GenerateAdjacency3(probability,numberOfNodes)
% matrix=fix(rand(numberOfNodes)+probability);
% adjacency=triu(matrix)'+triu(matrix);
% adjacency=adjacency-diag(diag(adjacency)); %ones everyone except diagonal