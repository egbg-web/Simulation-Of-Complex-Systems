clear  all
clc
clf 

gridSize=100;
d=0.8;
% beta=0.9;
% gamma=0.01;
numberTimeSteps=1000;
numberTrials=2;
 
gammaVector=0.0007*1.398.^(1:20);
betaVector=[0.6];

output3=0;
%  average=[];
    
for s=1:length(betaVector)
      beta=betaVector(s);
    
for jTrials=1:numberTrials
      
  for k=1:length(gammaVector)
      gamma=gammaVector(k);
      
    numberAgents=1000;
    numberInfected=10;
    numberSusceptible=numberAgents-numberInfected;
    infectedAgents=InitializePositions(numberInfected,gridSize);
    susceptibleAgents=InitializePositions(numberSusceptible,gridSize);   
    recoveredAgents=zeros(0,2);  
    iTime=0;
    
while numberInfected > 0 
    iTime=iTime+1;
      
[susceptibleAgents, infectedAgents]=CheckForInfections(susceptibleAgents,infectedAgents,beta);
[recoveredAgents, infectedAgents] =RecoveredFromInfection(gamma, infectedAgents, recoveredAgents); 
      
numberSusceptible=size(susceptibleAgents,1);
updatedPositionSusceptible=UpdatePositions(susceptibleAgents,numberSusceptible,d,gridSize);
susceptibleAgents=updatedPositionSusceptible;


numberInfected=size(infectedAgents,1);
updatedPositionInfected=UpdatePositions(infectedAgents,numberInfected,d,gridSize);
infectedAgents=updatedPositionInfected;


numberRecovered=size(recoveredAgents,1);
updatedPositionRecovered=UpdatePositions(recoveredAgents,numberRecovered,d,gridSize);
recoveredAgents=updatedPositionRecovered;

output1(iTime,:)=[numberSusceptible, numberInfected, numberRecovered];

if iTime == 10000
    output1(iTime,:)=[0, 0, 1000];
    break
end 

% if numberSusceptible==0
%     output1(iTime,3)=1000;
%     break
% end 

end 

output2(k)=output1(iTime,3);
fraction(k)=beta/gamma;

  end 
output3=output2+output3;

end
average(s,:)=output3/numberTrials;

  hold on
plot(fraction, average)
drawnow
  end 

% figure(1)
% 
% x=betaVector./gammaVector;
% y=finalOutput1;
% plot(x,y,'b')
title('Epidemic threshold, beta=0.6')
xlabel('beta/gamma')
ylabel('Recovered agents at t=1000 (averaged over 10 runs)')
