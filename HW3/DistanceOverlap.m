function [xPos,yPos]=DistanceOverlap(numberParticles,xPos,yPos,gridSize,R,n)

for i=1:numberParticles
    for j=1:numberParticles
        if j~=i
            
            distanceX = [xPos(i,n+1)-xPos(j,n+1)];
            distanceY = [yPos(i,n+1)-yPos(j,n+1)];
            distance=sqrt(distanceX^2+distanceY^2);
            
            if distance < 2*R
                normalizedDistanceOverlap=[distanceX, distanceY]/(norm([distanceX, distanceY]));
                meanX=(xPos(i,n+1)+xPos(j,n+1))/2;
                meanY=(yPos(i,n+1)+yPos(j,n+1))/2;
                
                xPos(i,n+1)=meanX+normalizedDistanceOverlap(1)*R;
                xPos(j,n+1)=meanX-normalizedDistanceOverlap(1)*R;
                yPos(i,n+1)=meanY+normalizedDistanceOverlap(2)*R;
                yPos(j,n+1)=meanY-normalizedDistanceOverlap(2)*R;
            end           
        end
    end
end
end

