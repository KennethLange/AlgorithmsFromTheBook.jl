module FrankWolfeTest

using LinearAlgebra, Test, AlgorithmsFromTheBook


@testset "Floyd Warshall" begin
    
  P = 2 * [[3.0 1.0]; [1.0 1.0]];
  q = [1.0, 6.0];
  tol = 1e-6;
  x = zeros(2); # initial value is destroyed
  y = FrankWolfe(BallSupport, P, q, x, tol)
  x = zeros(2);
  z = FrankWolfe(L1BallSupport, P, q, x, tol)
    
@test z ≈ [0.0, -1.0]

end
end



