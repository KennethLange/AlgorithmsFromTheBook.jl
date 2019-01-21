module PoissonDeviateTest

using AlgorithmsFromTheBook, Random, Statistics, StatsBase, Test

@testset "Poisson rv" begin
Random.seed!(123)
(mu, n) = (2.0, 10000);
x = poisson_deviate(mu, n);
#describe(x)
@test abs(mean(x) - var(x)) < 1
end

end