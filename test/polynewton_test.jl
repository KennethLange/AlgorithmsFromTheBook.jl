module PolyNewtonTest

using AlgorithmsFromTheBook, NumericIO, Test

@testset "polynewton test" begin
  # (x-1)^2(x-2)=(x^2-2x+1)(x-2)=(x^3-4x^2+5x-2)
  c = [-2.0, 5.0, -4.0, 1.0]; # coefficients of polynomial

  x = 0.0;
  (x, iters) = poly_newton(c, x, 1.0e-12)
  @test x ≈ 0.9999991263444146
  @test iters ≈ 21

  x = 1.75;
  (x, iters) = poly_newton(c, x, 1.0e-12)
  @test x ≈ 2.000000000000009
  @test iters ≈ 5


end

end