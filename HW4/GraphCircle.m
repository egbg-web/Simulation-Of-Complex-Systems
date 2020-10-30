function graph = GraphCircle(n,c)

graph = zeros(n);

for i = 1:(c/2)
    for j = 1:n
        
        node = j+i;
        
        if node > n
            node = node-n;
        end
        
        graph(node,j) = 1;
        
        node = j-i;
        
        if node < 1
            node = node + n;
        end
        
        graph(node,j) = 1;
        
    end
end
end