module MatrixMultiplyTest

using AlgorithmsFromTheBook, Test, Random, LinearAlgebra

@testset "matrix multiply" begin
    
  Random.seed!(123)
  (m, n, p, r) = (1000, 100, 1000, 100);
  A = randn(m, n);
  B = randn(n, p);
  C = A * B;

  D = randommultiply(A, B, r);
  E = norm(C - D) / (m * p)
  
@test  E ≈ 0.010340861168678757

end

end
