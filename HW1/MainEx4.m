clear
clc
clf

diffusionRate=0.8;
gridSize=100;
numberOfRuns=2;

vectorOfGamma=0.0007*1.398.^(1:20);
vectorOfBeta=linspace(0.1,0.9,9);


for i=1:length(vectorOfBeta)
    outputAgents3=0;
    infectionRate=vectorOfBeta(i);
    
    
    for iRuns=1:numberOfRuns
        
        for j=1:length(vectorOfGamma)
            recoveryRate=vectorOfGamma(j);
            
            numberOfAgents=1000;
            numberOfInfected=10;
            numberOfSusceptibles=numberOfAgents-numberOfInfected;
            infectedAgents=InitializePosition(numberOfInfected,gridSize);
            susceptibleAgents=InitializePosition(numberOfSusceptibles,gridSize);
            recoveredAgents=zeros(0,2);
            k=0;
            
            
            while numberOfInfected > 0
                k=k+1;
                
                
                [susceptibleAgents, infectedAgents]=CheckInfection(infectedAgents,susceptibleAgents,infectionRate);
                [recoveredAgents, infectedAgents]=RecoveryInfection(infectedAgents,recoveredAgents,recoveryRate);
                
                
                %susceptibles
                numberOfSusceptibles=size(susceptibleAgents,1);
                updatedSusceptibleAgents=UpdatePositions(numberOfSusceptibles,susceptibleAgents,diffusionRate,gridSize);
                susceptibleAgents=updatedSusceptibleAgents;
                
                %infected
                numberOfInfected=size(infectedAgents,1);
                updatedInfectedAgents=UpdatePositions(numberOfInfected,infectedAgents,diffusionRate,gridSize);
                infectedAgents=updatedInfectedAgents;
                
                %recovered
                numberOfRecovered=size(recoveredAgents,1);
                updatedRecoveredAgents=UpdatePositions(numberOfRecovered,recoveredAgents,diffusionRate,gridSize);
                recoveredAgents=updatedRecoveredAgents;
                
                outputAgents1(k,:)=[numberOfRecovered, numberOfInfected, numberOfSusceptibles];
                
                if k == 10000
                    outputAgents1(k,:)=[1000, 0, 0];
                    break
                end
                
            end
            
            outputAgents2(j)=outputAgents1(k,1);
            ratio(j,i)=infectionRate/recoveryRate;
            
        end
        outputAgents3=outputAgents2+outputAgents3;
        
    end
    averageRecovery(:,i)=outputAgents3/numberOfRuns;
    
end
finalInfectionRate=vectorOfBeta.*ones(length(vectorOfGamma),length(vectorOfBeta));

surf(ratio, averageRecovery, finalInfectionRate)


title('Epidemic threshold 3D phase diagram')
xlabel('\beta/\gamma')
ylabel('R_\infty averaged over 2 runs')
zlabel('\beta')