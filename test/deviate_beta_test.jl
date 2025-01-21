module DeviateBetaTest

using Statistics, Test, Random, AlgorithmsFromTheBook


@testset "deviate beta" begin
  Random.seed!(123)
  (a, b, n) = (3.0, 2.0, 10000);
  z = beta_deviate(a, b, n);
  mu = a / (a + b);
  sigma2 = (a * b) / ((a + b)^2 * (a + b + 1));
  # println(mean(z),"  ",mu,"  ", std(z)^2,"  ", sigma2)
@test mean(z) ≈ 0.5951696575519839
@test mu ≈ 0.6
@test std(z)^2 ≈ 0.04020216063365488
@test sigma2 ≈ 0.04

end

end