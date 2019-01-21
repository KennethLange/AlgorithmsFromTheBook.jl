module NormalDeviateTest

using AlgorithmsFromTheBook, Random, Statistics, StatsBase, Test

@testset "normal rv" begin
Random.seed!(123)
(mu, sigma, n) = (1.0, 2.0, 100000);
x = normal_deviate(mu, sigma, n);
#describe(x)
@test mean(x) - 1 < 1e-1
end

end