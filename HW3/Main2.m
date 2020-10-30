clear
clc
clf

N=100;
dt=10^-2;
numberParticles=100;
R=2.2*10^-5; %particle radius
T=300;
eta=0.001;
V=6*10^-4; %1*10^-6;
W=0;

gridSize = 1*10^-3;
xPos=randn(numberParticles,1)*gridSize;
yPos=randn(numberParticles,1)*gridSize;



[xPos,yPos,DR,DT,torqueVector] = TourqeStep(N,dt,xPos,yPos,R,T,eta,V,W,gridSize, numberParticles);






