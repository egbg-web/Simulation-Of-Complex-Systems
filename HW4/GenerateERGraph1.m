function graph = GenerateERGraph1(n,p)

graph = zeros(n);

for i=1:n
    for j=i+1:n
        r=rand;
      if r<=p
          graph(i,j)=1;
          graph(j,i)=1; 
      end
    end
end
graph=sparse(graph);
end
