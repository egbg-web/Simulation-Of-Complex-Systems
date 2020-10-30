function clusteringCoefficient = ClusteringCoefficient(graph)

numberOfTriangles=trace(graph^3)/2;
numberConnectedTriplets= arrayfun(@(k) k*(k-1)/2, sum(graph)); %sum all nodes and then sum all triplets
numberConnectedTriplets=sum(numberConnectedTriplets);

clusteringCoefficient=numberOfTriangles/numberConnectedTriplets;

end












