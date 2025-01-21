module KarmarkarTest

using Test, AlgorithmsFromTheBook, LinearAlgebra, Random


@testset "karmarkar" begin
    
  Random.seed!(123)
  c = [-2.0; -3; -4; 0; 0]; # Wikipedia example
  A = [ 3.0 2 1 1 0; 2 5 3 0 1 ];
  b = [ 10.0; 15 ];
  tol = 1e-5;
  (status, iterations, cost, x) = karmarkar_program(A, b, c, tol)
  
@test  iterations ≈ 106
@test  cost ≈ -20.000000740424188
@test  x ≈ [1.1121393792769484e-8, 2.0185776484859075e-9, 5.000000178031417, 5.000000052032442, 5.549476853899687e-9]

end

end 