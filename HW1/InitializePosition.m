function positions=InitializePosition(numberOfAgents,gridSize)

for j=1:numberOfAgents
    x = randperm(gridSize,1);   
    y = randperm(gridSize,1);  
    positions(j,:)= [x,y];
end
end
    