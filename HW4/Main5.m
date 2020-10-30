clear all;
close all;
clc;

smallWorldExample
sizeNetwork = size(A,1);

graph = A;

[averageLength,diameter]=Path(graph,sizeNetwork)


