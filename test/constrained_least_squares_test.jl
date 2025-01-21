module LinearAlgebra

using Test, AlgorithmsFromTheBook, Random

@testset "constrained least squares" begin
  Random.seed!(123)
  (n, p, s) = (10, 5, 2); # (cases, parameters, constraints)
  A = randn(n, p);
  b = randn(n);
  C = randn(s, p);
  d = randn(s);
  (x, u) = constrained_lsq(A, C, b, d, 1.0e10);
  
  # println(x)
  @test x ≈  [0.511201732114256, 0.5513059858858479, -0.19475903232221672, 0.1229475363514454, -0.28278145167334723]
end

end

