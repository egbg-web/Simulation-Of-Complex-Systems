clear all;
close all;
clc;

smallWorldExample

sizeNetwork = size(A,1);

graph = A;

clusteringCoefficient = ClusteringCoefficient(graph)


%cBig=3/4*(c-2)/(c-1)

format long
PlotGraph(graph,sizeNetwork);