function [xPos,yPos,DR,DT,torqueVector] = TourqeStep(N,dt,xPos,yPos,R,T,eta,V,W,gridSize, numberParticles)

DT = 0.22*10^-12;  %kB*T/gamma; % translational diffusion coefficient [m^2/s]
DR = 0.0016; %inga kluster=0.16, mellanstora kluster:0.016, stora kluster:0.0000016     %6*DT/(8*R^2); % rotational diffusion coefficient [rad^2/s]
T0=1*10^-8; %0 inga kluster, 9*10^-9 små kluster, 4*10^-7 stora kluster, 
angleVector = [(2*pi*randn(numberParticles,1)) zeros(numberParticles,N-1)];
criticalDistance= 5*R; %5*R;

% prepare plot
figure;
for j = 1:numberParticles
    figureHandle(j) = plot(xPos(j,1), yPos(j,1),'ro','MarkerSize',5); %'MarkerSize',20 
    hold on;
end
axis([-gridSize gridSize -gridSize gridSize]);

for n = 1:N
    
    torqueVector(:,n)=CalculateTorque(V,T0,xPos,yPos, angleVector, n, numberParticles,criticalDistance);
    
    for i=1:numberParticles
        
        % Rotational diffusion step
        angleVector(i,n+1)=angleVector(i,n) + torqueVector(i,n)*dt +  sqrt(2*DR*dt)*normrnd(0,1);
        
        % Translational diffusion step in x and y
        
        xPos(i,n+1) = xPos(i,n) + V*dt*cos(angleVector(i,n)) + sqrt(2*DT*dt)*normrnd(0,1);
        yPos(i,n+1) = yPos(i,n) + V*dt*sin(angleVector(i,n)) + sqrt(2*DT*dt)*normrnd(0,1);
        
        %periodic boundaries
        if xPos(i,n+1) > gridSize
            xPos(i,n+1) = xPos(i,n+1) - 2*gridSize;
        elseif xPos(i,n+1) < -gridSize
            xPos(i,n+1) = xPos(i,n+1) + 2*gridSize;
        end
        
        if yPos(i,n+1) > gridSize
            yPos(i,n+1) = yPos(i,n+1) - 2*gridSize;
        elseif yPos(i,n+1) < -gridSize
            yPos(i,n+1) = yPos(i,n+1) + 2*gridSize;
            
        end
    end
    
    [xPos,yPos]=DistanceOverlap(numberParticles,xPos,yPos,gridSize,R,n);
    
    
    for k = 1:numberParticles
        set(figureHandle(k),'XData',xPos(k,n),'YData', yPos(k,n))
        %     F(k)=getframe(gcf);
        %     drawnow
    end
    %pause(0.06)
    drawnow
    %
    %     writeObj=VideoWriter('myVideo.avi');
    %     writeObj.FrameRate=10;
    %
    %     open(writeObj);
    %
    %     for m=1:length(F)
    %         frame=F(i);
    %         writeVideo(writeObj,frame);
    %     end
    %     close(writeObj);
    
end
end


