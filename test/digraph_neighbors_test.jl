module DigraphNeighbors

using AlgorithmsFromTheBook, Test

@testset "dia.neighbors" begin

  nodes = 4;
  A = zeros(nodes, nodes);
  A[1, 3] = 2;
  A[2, 1] = 4;
  A[2, 3] = 3;
  A[3, 4] = 2;
  A[4, 2] = 1;
  (incoming, outgoing) = neighborhoods(A)
  
  length1 = []
  sumA    = []
  for i =1:nodes
      push!(length1,length(outgoing[i]))
      push!(sumA,   sum(A[i,outgoing[i]]))
  end
  for i =1:nodes
      push!(length1,length(incoming[i]))
      push!(sumA,   sum(A[incoming[i], i]))
  end
@test length1 ≈ [1, 2, 1, 1, 1, 1, 2, 1]
@test sumA ≈ [2.0, 7.0, 2.0, 1.0, 4.0, 1.0, 5.0, 2.0]
      
end


end