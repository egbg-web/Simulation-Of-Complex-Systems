clear all 
clc
clf

recoveryRate=0.01;
diffusionRate=0.8;
infectionRate=0.6;
numberOfAgents=1000;
gridSize=100;
numberOfInfected=100;
numberOfSusceptibles=numberOfAgents-numberOfInfected;
recoveredAgents=zeros(0,2);
numberOfSteps=1000;


infectedAgents=InitializePosition(numberOfInfected,gridSize);
x1=infectedAgents(:,1);
y1=infectedAgents(:,2);

scatter(x1,y1,25,'r','filled')
grid on
grid minor
axis([0 gridSize 0 gridSize])
hold on

susceptibleAgents=InitializePosition(numberOfSusceptibles,gridSize);
x2=susceptibleAgents(:,1);
y2=susceptibleAgents(:,2);

scatter(x2,y2,25,'b','filled')
grid on
grid minor
axis([0 gridSize 0 gridSize])

for iSteps=1:numberOfSteps
hold off

[susceptibleAgents, infectedAgents]=CheckInfection(infectedAgents,susceptibleAgents,infectionRate);
[recoveredAgents, infectedAgents]=RecoveryInfection(infectedAgents,recoveredAgents,recoveryRate);

%susceptibles
numberOfSusceptibles=size(susceptibleAgents,1);
updatedSusceptibleAgents=UpdatePositions(numberOfSusceptibles,susceptibleAgents,diffusionRate,gridSize);
susceptibleAgents=updatedSusceptibleAgents;

x3=susceptibleAgents(:,1);
y3=susceptibleAgents(:,2);
scatter(x3,y3,25,'b','filled')
grid on
grid minor 
axis([0 gridSize 0 gridSize])
hold on

%infected
numberOfInfected=size(infectedAgents,1);
updatedInfectedAgents=UpdatePositions(numberOfInfected,infectedAgents,diffusionRate,gridSize);
infectedAgents=updatedInfectedAgents;

x4=infectedAgents(:,1);
y4=infectedAgents(:,2);
scatter(x4,y4,25,'r','filled')
grid on
grid minor 
axis([0 gridSize 0 gridSize])
hold on

%recovered
numberOfRecovered=size(recoveredAgents,1);
updatedRecoveredAgents=UpdatePositions(numberOfRecovered,recoveredAgents,diffusionRate,gridSize);
recoveredAgents=updatedRecoveredAgents;

x5=recoveredAgents(:,1);
y5=recoveredAgents(:,2);
scatter(x5,y5,25,'g','filled')
grid on
grid minor 
axis([0 gridSize 0 gridSize])

outputAgents(iSteps,:)=[numberOfRecovered, numberOfInfected, numberOfSusceptibles];

title('t=1000')
xlabel('x')
ylabel('y')


drawnow 
end

figure(2);
x =linspace(0,numberOfSteps,numberOfSteps);
y6 = outputAgents(:,1);
y7 = outputAgents(:,2);
y8 = outputAgents(:,3);
plot(x,y6,'g',x,y7,'r',x,y8,'b')
title('d=0.8, beta=0.9, gamma=0.001')
xlabel('Time Steps')
ylabel('Number of Agents')


