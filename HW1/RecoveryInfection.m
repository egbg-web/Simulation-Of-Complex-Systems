function [recoveredAgents, infectedAgents]=RecoveryInfection(infectedAgents,recoveredAgents,recoveryRate)

counter=size(recoveredAgents,1)+1;
numberOfInfectedAgents=size(infectedAgents,1);
tempVector=[];


for j=1:numberOfInfectedAgents
    r=rand;
    
    if r < recoveryRate
        recoveredAgents(counter,:) = infectedAgents(j,:);
        tempVector=[tempVector j];
        counter=counter+1;
        
    end
end
infectedAgents(tempVector,:)=[];
end
