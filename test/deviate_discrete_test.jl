module DiscreteDeviateTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, StatsBase, Test

@testset "discrete rv" begin
Random.seed!(123)
(categories, n) = (5, 10000)
mass = rand(categories);
x = discrete_deviate(mass, n);
#describe(x)
m = dot([i for i = 1:categories], mass / sum(mass)) # match means
@test m ≈ 2.5292209061197397
end

end