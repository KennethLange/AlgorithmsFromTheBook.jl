module InvLowerTriTest

using LinearAlgebra, Test, AlgorithmsFromTheBook, Random

@testset "inverts lower triangular" begin
    
  Random.seed!(123)
  n = 10;
  L = LowerTriangular(randn(n, n));
  M = inv_lower_tri(L);
  # println(norm(M * L - I),"  ",norm(inv(L) * L - I))
  
@test norm(M * L - I) ≈ 9.16155634361527e-14
@test norm(inv(L) * L - I) ≈ 2.560343930182393e-13
end

end