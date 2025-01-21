module FloydWarshallTest

using Test, AlgorithmsFromTheBook

@testset "FloydW" begin
  
  n = 4;
  w = zeros(n, n); # Wikipedia example
  w .= Inf;
  (w[1, 3], w[2, 1], w[2, 3], w[3, 4], w[4, 2]) = (-2, 4, 3, 2, -1)
  dist = FloydWarshall(w);
  dist_all = []
  for i = 1:n
      push!(dist_all,dist[i, :])
  end
  
@test dist_all ≈ [[0.0, -1.0, -2.0, 0.0],
                  [4.0, 0.0, 2.0, 4.0],
                  [5.0, 1.0, 0.0, 2.0],
                  [3.0, -1.0, 1.0, 0.0]]
end
end