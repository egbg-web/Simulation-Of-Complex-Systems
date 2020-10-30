function [x,t,DR,DT] = BrownianMotion(N,dt,x0,R,T,eta,V,W)
kB = 1.38e-23; % Boltzmann constant [J/K]
gamma = 6*pi*R*eta; % friction coefficient [Ns/m]
DT = kB*T/gamma; % translational diffusion coefficient [m^2/s]
DR = 6*DT/(8*R^2); % rotational diffusion coefficient [rad^2/s]
x(1,:) = x0; % initial conditions (position)
theta = 0; % initial conditions (angle)

for n = 1:1:N
    
for i=0:length(x0)*0.5-1
    
%translational step   
x(n+1,2*i+1:2*i+2) = x(n,2*i+1:2*i+2) + sqrt(2*DT*dt)*randn(1,2);

% Rotational diffusion step
theta = theta + sqrt(2*DR*dt)*randn(1,1);

% Drift step
x(n+1,2*i+1:2*i+2) = x(n+1,2*i+1:2*i+2) + dt*V(i+1)*[cos(theta) sin(theta)];

end 
% Plot
figure(1)
clf
hold on
a=plot(x(1:n+1,1)*1e6,x(1:n+1,2)*1e6,'k');
b=plot(x(n+1,1)*1e6,x(n+1,2)*1e6,'o', ...
'MarkerEdgeColor','k', ...
'MarkerFaceColor','k');
hold on

c=plot(x(1:n+1,3)*1e6,x(1:n+1,4)*1e6,'r');
d=plot(x(n+1,3)*1e6,x(n+1,4)*1e6,'o', ...
'MarkerEdgeColor','r', ...
'MarkerFaceColor','r');
hold on

e=plot(x(1:n+1,5)*1e6,x(1:n+1,6)*1e6,'b');
f=plot(x(n+1,5)*1e6,x(n+1,6)*1e6,'o', ...
'MarkerEdgeColor','b', ...
'MarkerFaceColor','b');
hold on

g=plot(x(1:n+1,7)*1e6,x(1:n+1,8)*1e6,'g');
h=plot(x(n+1,7)*1e6,x(n+1,8)*1e6,'o', ...
'MarkerEdgeColor','g', ...
'MarkerFaceColor','g');
hold off

axis equal square
title(['Brownian motion',', ','angular velocity = ' num2str(W) ' rad/s, ', ...
'time = ', num2str(dt*(n+1)) ' s'])
xlabel('x [\mum]')
ylabel('y [\mum]')
legend([b d f h],{'V=0\mum/s', 'V=1\mum/s','V=2\mum/s', 'V=3\mum/s'})
box on
axis equal
drawnow();

end 

t = [0:dt:(N-1)*dt];

end