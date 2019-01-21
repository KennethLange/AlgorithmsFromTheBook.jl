module UniformDeviateTest

using AlgorithmsFromTheBook, Random, Statistics, StatsBase, Test

@testset "uniform rv" begin
Random.seed!(123)
(n, seed) = (100000, [20761807, 58933051]);
x = zeros(n);
for i = 1:n
  x[i] = uniform_deviate(seed)
end
#describe(x)
@test mean(x) - 0.5 < 0.1
@test var(x) - 1/12 < 0.1
end

end