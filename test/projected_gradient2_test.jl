module ProjectedGradient2Test



using LinearAlgebra, ForwardDiff, Test, Random, AlgorithmsFromTheBook

@testset "Projected Gradient 2" begin
    
  Random.seed!(123)
  (n, p, tol) = (500, 100, 1.0e-8);
  (X, y) = (randn(n, p), randn(n));
  L = opnorm(X)^2; # Lipschitz constant
  f(z) = norm(y - X * z)^2 / 2; # least squares criterion
  Proj1(z) =  BallProjection(z); # projection onto the unit ball
  (b, obj) = ProjectedGradient2(f, Proj1, zeros(p), L, tol);
  @test obj ≈ 204.1401763398648
  Proj2(z) = OrthantProjection(z); # projection onto nonnegative orthant
  (b, obj) = ProjectedGradient2(f, Proj2, zeros(p), L, tol);
  @test obj ≈ 235.87720598550519
  
  
end

end



