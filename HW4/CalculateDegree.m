function [degreePercentage,degree]=CalculateDegree(row,n)

for i=1:n+1
    degree(i)=length(find(row==(i-1)));
end 

degree(degree==0)=[];

for j=1:n
    numberOfDegree(j)=length(find(degree==(j)));
end 

degreePercentage=numberOfDegree/(n-1);

end