function [susceptibleAgents, infectedAgents]=CheckInfection(infectedAgents,susceptibleAgents,infectionRate)


numberOfSusceptibleAgents=size(susceptibleAgents,1);
numberOfInfectedAgent=size(infectedAgents,1);
tempVector=[];


for j=1:numberOfSusceptibleAgents
    
    for k=1:numberOfInfectedAgent
   
        if susceptibleAgents(j,:) == infectedAgents(k,:)
            r=rand;
            if r < infectionRate
                infectedAgents(size(infectedAgents,1)+1,:)=susceptibleAgents(j,:);
                tempVector=[tempVector j];
               
            end
               
        end
        
    end
   
end
susceptibleAgents(tempVector,:)=[]; 
end
