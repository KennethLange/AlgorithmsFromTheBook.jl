module NashTest

using LinearAlgebra, Test, Random, AlgorithmsFromTheBook
@testset "nash" begin
    
  Random.seed!(123)
  (m, n, tol) = (100, 50, 1e-12);
  M = randn(m, n);
  Msave = copy(M);
  (U, d, V) = nash(M, tol);
  Z = norm(Msave - U * (Diagonal(d) * V'))

@test Z == 5.822522867075659e-13
  
  
end
end



