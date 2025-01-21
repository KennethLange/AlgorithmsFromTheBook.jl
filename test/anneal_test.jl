module AnnealTest

using AlgorithmsFromTheBook, Distances, Random, Test

@testset "annealing" begin
Random.seed!(123)
n = 50;
X = rand(2, n);
dist = pairwise(Euclidean(), X);
(cost, path) = anneal(dist)
cost0 = dist[size(dist, 1), 1]
cost1 = dist[path[size(dist, 1)], path[1]]
for i in 2:size(dist, 1)
    cost0 += dist[i - 1, i]
    cost1 += dist[path[i - 1], path[i]]
end
@test cost < cost0
@test cost ≈ cost1
end

end