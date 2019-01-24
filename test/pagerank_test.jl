module PageRankTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, SparseArrays, Test

@testset "pagerank" begin
Random.seed!(123)
"""Prepares data for Pagerank."""
function transpose_transition_matrix(m::Int)
  m = 100
  Q = spzeros(m, m)
  for i = 1:m
    neighbor = rand(1:m, 5) # each node has about 5 neighbors
    neighbor = setdiff(unique(neighbor), [i])
    for j in neighbor
      Q[j, i] = 1.0 / length(neighbor)
    end 
  end
  return Q
end

m = 100;
Q = transpose_transition_matrix(m);
u = rand(m);
u = u / sum(u);
(alpha, n) = (0.05, 20);
v = pagerank(Q, u, alpha, n);
R = (1.0 - alpha) * Q + (alpha / m) * ones(m, m);
@test norm(R * v - v) < 1e-8
end

end