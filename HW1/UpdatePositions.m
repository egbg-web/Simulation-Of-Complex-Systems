function updatePositions=UpdatePositions(numberOfAgents,positions,diffusionRate,gridSize)

updatePositions=positions;

for j=1:numberOfAgents
    r=rand;
    randomisedPositions=randperm(2,1);
    
    if r < diffusionRate
        updatePositions(j,randomisedPositions)=positions(j,randomisedPositions)+sign(randn);
        
        if updatePositions(j,randomisedPositions) > gridSize
            updatePositions(j,randomisedPositions) = gridSize;
            
        else if updatePositions(j,randomisedPositions) < 0
                updatePositions(j,randomisedPositions) = 0;
            end
        end
        
    else
        updatePositions(j,randomisedPositions) = positions(j,randomisedPositions);
    end
end
end
