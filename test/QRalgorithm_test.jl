module QRalgorithm_test
using LinearAlgebra, Random, Test, AlgorithmsFromTheBook

@testset "QR algorithm" begin
    
  Random.seed!(123)
  A = randn(10, 10);
  A = (A + A') / 2;
  Asave = copy(A);
  (E, D) = QRorchestrate(A); # E eigenvectors and D eigenvalues
  n1 = norm(E * D * E' - Asave) # spectral decomposition check
  n2 = norm(E * E' - I) # orthogonality check for E

  @test n1 ≈ 2.0706134450770425e-14
  @test n2 ≈ 6.0754176678320415e-15

end

end