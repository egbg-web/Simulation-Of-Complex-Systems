function MSD=MeanSquareDisplacement(x,N)

for i=0:size(x,2)*0.5-1
    
for j=1:N
    
    deltaSum=0;
    
for k=1:(N-j)
    
    deltaX=x(k+j,2*i+1)-x(k,2*i+1);
    deltaY=x(k+j,2*i+2)-x(k,2*i+2);
    
    delta=deltaX^2+deltaY^2;
    
    deltaSum=deltaSum+delta;
end
    MSD(j,i+1)=deltaSum/(N-j);
    
end
end