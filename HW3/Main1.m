clear all
clc
clf


N=100;
dt=1*10^-2;
x0=rand(8,1)*10^-6;
R=3*1e-6;
T=300;
eta=0.001; 
V=[0 1*10^-6 2*10^-6 3*10^-6];
W=0;
sumOfMSD=zeros(N,4);

[x,t,DR,DT] = BrownianMotion(N,dt,x0,R,T,eta,V,W);

MSD = MeanSquareDisplacement(x,N);

for i=1:N
    
    sumOfMatrix=MSD(1:i,:);
    sumOfMSD(i,:)=sum(sumOfMatrix);
    
end

figure(2)
clf
plot(log(t),log(sumOfMSD(:,1)),'k')
hold on 

plot(log(t),log(sumOfMSD(:,2)),'r')
hold on

plot(log(t),log(sumOfMSD(:,3)),'b')
hold on

plot(log(t),log(sumOfMSD(:,4)),'g')
hold on
title('Mean Square Displacement')
xlabel('log(t)')
ylabel('log(MSD)\mum/s')