clear;
clc

Network1;


matrixSize1=size(s,1);
zeroMatrix1=zeros(matrixSize1,3);
zeroMatrix1(:,3)=1;
zeroMatrix1(:,1:2)=s;
matrix1=spconvert(zeroMatrix1);
matrix1=full(matrix1);

n1=size(matrix1,1);


%PlotGraph(matrix1,n1);

%ClusteringCoefficient(matrix1);

%[averageLength, diameter]=Path(matrix1,n1);

[row column]=find(matrix1==1);
coordinates=[row column];
[degreePercentage degree]=CalculateDegree(row,n1);

figure(1)
histogram(degree)
x=linspace(0,n1,n1); 
title('Histogram of actual degree distribution')
% subplot(2,1,2)
% plot(x,degreePercentage)
% hold on
% theoreticalPredictions = TheoreticalPrediction(n1, probability);
% subplot(2,1,2)
% plot(x,theoreticalPredictions)
% legend('Actual degree distributions','Theoretical predictions')
% title('Procentage of actual and theoretical distributions')

%%
clear;
clc;

Network2;

matrixSize2=size(d,1);
zeroMatrix2=zeros(matrixSize2,3);
zeroMatrix2(:,3)=1;
zeroMatrix2(:,1:2)=d;
matrix2=spconvert(zeroMatrix2);
matrix2=full(matrix2);

n2=size(matrix2,1);

%PlotGraph(matrix2,n2);

%ClusteringCoefficient(matrix2);

%[averageLength, diameter]=Path(matrix2,n2);

[row column]=find(matrix2==1);
coordinates=[row column];
[degreePercentage degree]=CalculateDegree(row,n2);

figure(1)
histogram(degree)
x=linspace(0,n2,n2); 
title('Histogram of actual degree distribution')
% subplot(2,1,2)
% plot(x,degreePercentage)

%%
clear;
clc;

Network3;

matrixSize3=size(f,1);
zeroMatrix3=zeros(matrixSize3,3);
zeroMatrix3(:,3)=1;
zeroMatrix3(:,1:2)=f;
matrix3=spconvert(zeroMatrix3);
matrix3=full(matrix3);

n3=size(matrix3,1);

%PlotGraph(matrix3,n3);

%ClusteringCoefficient(matrix3);

%[averageLength, diameter]=Path(matrix3,n3);

[row column]=find(matrix3==1);
coordinates=[row column];
[degreePercentage degree]=CalculateDegree(row,n3);

figure(1)
histogram(degree)
x=linspace(0,n3,n3); 
title('Histogram of actual degree distribution')
% subplot(2,1,2)
% plot(x,degreePercentage)

