module SymtridiagTest
using LinearAlgebra, Random, Test, AlgorithmsFromTheBook
@testset "symetric diag" begin
    
  Random.seed!(123)
  n = 100
  A = Symmetric(randn(n, n));
  B = copy(A);
  (T, O) = symtridiag(A);
  s1 = norm(I - O * O')
  s2 = norm(B - O * T * O')

@test s1 ≈ 1.1855732578834342e-14
@test s2 ≈ 1.4808652307059594e-13
  
end
end