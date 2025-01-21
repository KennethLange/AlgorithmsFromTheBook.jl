module ProjectedGradientTest

using LinearAlgebra
using Random, Test, AlgorithmsFromTheBook
@testset "project.grad" begin
    
  Random.seed!(123)
  (n, p, r, tol) = (500, 100, 0.5, 1.0e-8);
  X = randn(n, p);
  y = randn(n);
  (b, obj) = ProjectedGradient(X, y, r, tol)
  # println(norm(b))

@test norm(b) ≈ 0.5000000000000001

end
end