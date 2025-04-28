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

  @test s1 ≈ 1.1728427757805826e-14
  @test s2 ≈ 1.4287056432258446e-13
  
end
end