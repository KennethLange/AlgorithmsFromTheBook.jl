module SensitivityTest

using ForwardDiff, LinearAlgebra, Random, Test, AlgorithmsFromTheBook

@testset "sensitive" begin
    
  Random.seed!(123)
  fun(y, q) = [y[1]^2 + y[1] + y[2]^2 - q[1], y[1]]
  x = ones(2);
  p = [2.0]; 
  s = sensitivity(fun, x, p)
  # println(s)

@test s ≈ [0.25; 0.25;;]

end
end