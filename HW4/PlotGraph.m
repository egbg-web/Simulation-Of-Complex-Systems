function PlotGraph(graph,n)

figure(2)
% define nodes on a circle
center=[0,0];
theta=linspace(0,2*pi,n+1);
rho=ones(1,n+1);%fit radius and nv
[X,Y] = pol2cart(theta',rho'); % 'pol2cart' transforms polar coordinates to Cartesian
X=X+center(1);
Y=Y+center(2);
x=X*(n*10);
y=Y*(n*10);

% create the network plot
gplot(graph,[x,y],'-*');
axis square

end