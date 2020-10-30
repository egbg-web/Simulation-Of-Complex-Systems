clear;
close all;
clc;

sizeNetwork = 100;
probability = 0.4;
c = 6;

graph = GraphCircle(sizeNetwork,c);

numberOfEdges=sizeNetwork*(c/2);

%shortcuts
for i = 1:numberOfEdges
    if (rand() < probability)
        index = randperm(sizeNetwork, 2);
        smallerIndex = min(index(1), index(2));
        biggerIndex = max(index(1), index(2));
        
        if graph(smallerIndex, biggerIndex) == 0
            graph(smallerIndex, biggerIndex) = 1;
            
        elseif graph(smallerIndex, biggerIndex) == 1 %replacement
            graph(smallerIndex, biggerIndex) = 0;
        end
    end
end

PlotGraph(graph,sizeNetwork)