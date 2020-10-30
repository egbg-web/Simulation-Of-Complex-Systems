function PlotGraphTwo(graph)
figure()
axes=10;
theta = (0:(pi*2/size(graph,1)):pi*2)';
x = arrayfun(@(x) axes*cos(x), theta);
y = arrayfun(@(x) axes*sin(x), theta);
gplot(graph, [x y]);
axis([-axes-1 axes+1 -axes-1 axes+1]);


end