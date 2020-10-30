function theoreticalPredictions = TheoreticalPrediction1(n,p)

theoreticalPredictions = (1:n)-1;

theoreticalPredictions = arrayfun(@(k) nchoosek((n-1),k)*p^k*(1-p)^(n-1-k), theoreticalPredictions);

end



