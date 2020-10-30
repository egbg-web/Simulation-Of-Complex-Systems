function distribution = TheoreticalPrediction3(numberOfNodes,m)

distribution=zeros(numberOfNodes,1);

for k=1:numberOfNodes
    distribution(k,1)=2*m^2*k^(-3+1);
end

distribution=distribution/sum(distribution);

end