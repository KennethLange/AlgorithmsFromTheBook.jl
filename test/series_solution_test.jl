module SeriesSolutionTest

using LinearAlgebra, Random, Test, AlgorithmsFromTheBook

@testset "series solution" begin
    
  Random.seed!(123)
  (p, d, tol) = (500, 200.0, 1e-10);
  y = randn(p);
  A = randn(p, p);
  # println(opnorm(A) / d) # check on spectral radius
  x = SeriesSolution(A, y, d, tol);
  s = norm(y - (A + d * I) * x)
  # println(s)

@test s ≈ 6.163864460955593e-10

end
end