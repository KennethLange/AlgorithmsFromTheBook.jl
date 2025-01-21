module MMcauchyTest

using LinearAlgebra, Distributions, StatsBase, Test, Random, AlgorithmsFromTheBook

@testset "MM cauchy" begin
    
  Random.seed!(123)
  (m, tol) = (100, 1.0e-10);
  d = Cauchy(1.0, 1.0);
  x = rand(d, m);
  (mu, sigma, iters) = MMcauchy(x, tol)
  
  # println([mu, sigma, iters])

@test [mu, sigma, iters] == [1.1140892689057142, 1.0311673749677523, 60.0]
  
  
end

end