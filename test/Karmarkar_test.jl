module KarmarkarTest

using Test, AlgorithmsFromTheBook, LinearAlgebra, Random


@testset "karmarkar" begin
    
  Random.seed!(123)
  c = [-2.0; -3; -4; 0; 0]; # Wikipedia example
  A = [ 3.0 2 1 1 0; 2 5 3 0 1 ];
  b = [ 10.0; 15 ];
  tol = 1e-5;
  (status, iterations, cost, x) = karmarkar_program(A, b, c, tol)
  
@test  iterations ≈ 104
@test  cost ≈ -19.99999928979529
@test  x ≈ [1.1126476653812827e-8, 2.0182223066156383e-9, 4.999999815371917, 4.999999892435626, 5.547911577414132e-9]
end

end 