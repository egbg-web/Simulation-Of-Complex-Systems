clear;
close all;
clc;

numberOfNodes=40;
sizeNetwork=1000;
m=4;
addedNodes=1000;

nodes = GenerateNode3(sizeNetwork,numberOfNodes);
adjacency = GenerateAdjacency3(numberOfNodes);


for i=1:addedNodes
    nodes = UpdateNode3(nodes,sizeNetwork);
    adjacency = AddConnections3(adjacency,m);
end


figure()
gplot(adjacency,nodes,'-*');

%distribution plot
numberNodesNormalDist = GenerateDistribution3(adjacency);

probabilitiesOne=(1:length(numberNodesNormalDist))/length(numberNodesNormalDist);

data = TheoreticalPrediction3(numberOfNodes+addedNodes,m);

probabilitiesTwo=(1:length(data))/length(data);

figure()
loglog(probabilitiesOne,sort(numberNodesNormalDist,'descend'),'.')
hold on
loglog(probabilitiesTwo,data,'.')
legend('Actual degree distributions','Theoretical predictions')

% inverse cumulative = sannolikheter på x-axeln och degrees på y axeln
