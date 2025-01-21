module KnapsackTest

using LinearAlgebra, Random, Test, AlgorithmsFromTheBook


@testset "karmarkar" begin
    
  Random.seed!(123)
  (p, trials, c) = (10, 1000000, 2.5);
  w = rand(p);
  prob = knapsack(w, c, trials)
  # println(prob)
  
@test prob ≈ 0.419617

end
end
