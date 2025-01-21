module MultivariateNewtonTest

using ForwardDiff, LinearAlgebra, Test, Random, AlgorithmsFromTheBook


@testset "Multi Newton" begin
    
  Random.seed!(123)
  g1(x) = [x[1]^3 - 2x[1] - 5.0];
  x0 = [2.5];
  (x, iterations) = multivariate_newton(g1, x0, 1.0e-12)
  g2(x) = [x[1]^2 + x[2]^2 - 2.0, x[1] - x[2]];
  x0 = [-3.0, 5.0];
  (x, iterations) = multivariate_newton(g2, x0, 1.0e-12)
  

@test [x, iterations] == [[1.0, 1.0], 9]
  
  
end

end
