module GammaDeviateTest

using AlgorithmsFromTheBook, Random, Statistics, Test

@testset "gamma rv" begin
Random.seed!(123)
(alpha, lambda, n) = (3.5, 2.0, 10000);
x = gamma_deviate(alpha, lambda, n);
@test lambda * mean(x) / alpha - 1 < 0.1
@test lambda^2 * var(x) / alpha - 1 < 0.1
end

end