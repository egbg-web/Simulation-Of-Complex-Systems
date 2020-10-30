function torqueVector=CalculateTorque(V,T0,xPos,yPos,angleVector,n,numberParticles,criticalDistance)

for i=1:numberParticles
    torqueSum=0;
    for j=1:numberParticles
        if j~=i
            normalizedVelocityVector=normalize(V*[cos(angleVector(i,n)), sin(angleVector(i,n)), 0]);
            distanceX = [xPos(i,n)-xPos(j,n)];
            distanceY = [yPos(i,n)-yPos(j,n)];
            distanceZ = 0;
            
            normalizedDistance=[distanceX, distanceY, distanceZ]/(norm([distanceX, distanceY, distanceZ]));
            scalarDistance = distanceX^2 + distanceY^2 + distanceZ^2;
            
            torque= T0 * cross((dot(normalizedVelocityVector,normalizedDistance)/scalarDistance)*normalizedVelocityVector,normalizedDistance);
            torque = torque(3);
            
            if scalarDistance<criticalDistance^2
                torqueSum = torqueSum + torque;
                
            end
        end
        torqueVector(i)= torqueSum;
    end
end
end


