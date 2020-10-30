clear
clc
clf

numberOfAgents=1;
gridSize=100;
diffusionRate=0.8;
infectionRate=0.6;
numberOfTimeSteps= 1000;

positions=InitializePosition(numberOfAgents,gridSize);
x=positions(:,1);
y=positions(:,2);

scatter(x,y,25,'bo','filled')
grid on
grid minor
axis([0 gridSize 0 gridSize])

for i=1:numberOfTimeSteps
      
updatedPositions=UpdatePositions(numberOfAgents,positions,diffusionRate,gridSize);
positions=updatedPositions;
x=positions(:,1);
y=positions(:,2);

scatter(x,y,25,'bo','filled')
grid on
grid minor 
axis([0 gridSize 0 gridSize])
drawnow
title('One agent random walk with: d=0.8, \beta=0.6, \gamma=0.01, t=1000')
xlabel('x')
ylabel('y')
hold on
end

