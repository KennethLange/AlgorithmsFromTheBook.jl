module CgLeastSquaresTest

using AlgorithmsFromTheBook, Test, Random, LinearAlgebra,  SparseArrays


@testset "cg ls" begin
    
  Random.seed!(123)
  (n, p, tol) = (500, 100, 1e-6);
  X = sprandn(n, p, .01);
  y = randn(n);
  z = cg_least_squares(X, y, tol);
  s = [norm(y - X * z), norm(y - X * (X \ y))]
  
@test s ≈ [20.2642202710894, 20.264220271089403]

end
end