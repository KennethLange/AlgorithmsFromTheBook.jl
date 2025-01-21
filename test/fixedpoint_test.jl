module FixedPoingTest

using Test, AlgorithmsFromTheBook, Random, SparseArrays, LinearAlgebra


@testset "fixed point" begin
  Random.seed!(123)
  
  (p, tol) = (1000, 1e-8);
  y = randn(p);
  N = sprand(p, p, 0.01); # for full matrix use rand(p, p)
  M = spzeros(p, p);
  for i = 1:p # make M - N strictly diagonally dominant
    s = sum(abs, N[i, :])
    M[i, i] = s + 1.0 # diagonal matrix for Jacobi method
    N[i, i] = 0.0
  end
  x = M \ y; # good initial value of x
  (iter, x) = fixedpoint(M, N, x, y, tol); 
  # println(iter,"  ",norm(y - M * x + N * x))
  
@test norm(y - M * x + N * x) ≈ 2.8289295159015107e-7
  
end

end

