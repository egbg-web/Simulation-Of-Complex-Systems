clear;
clc;
clf;

sizeNetwork = 100;
probability = 0.1;

graph = GenerateERGraph1(sizeNetwork, probability);

[row column]=find(graph==1);
coordinates=[row column];
[degreePercentage degree]=CalculateDegree(row,sizeNetwork);

figure(1)
subplot(2,1,1)
histogram(degree)
x=linspace(0,sizeNetwork,sizeNetwork); 
title('Histogram of actual degree distribution')
subplot(2,1,2)
plot(x,degreePercentage)
hold on
theoreticalPredictions = TheoreticalPrediction1(sizeNetwork, probability);
subplot(2,1,2)
plot(x,theoreticalPredictions)
legend('Actual degree distributions','Theoretical predictions')
title('Procentage of actual and theoretical distributions')


PlotGraph(graph,sizeNetwork);











