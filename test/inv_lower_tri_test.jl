module InvLowerTriTest

using LinearAlgebra, Test, AlgorithmsFromTheBook, Random

@testset "inv.lower.tri" begin
    
  Random.seed!(123)
  n = 10;
  L = LowerTriangular(randn(n, n));
  M = inv_lower_tri(L);
  # println(norm(M * L - I),"  ",norm(inv(L) * L - I))
  
  @test norm(M * L - I) ≈ 6.52014079880853e-14
  @test norm(inv(L) * L - I) ≈ 5.186569410446151e-14
end

end