module AnnealTest

using AlgorithmsFromTheBook, Distances, Random, Test

@testset "annealing" begin
Random.seed!(123)
n = 50;
X = rand(2, n);
dist = pairwise(Euclidean(), X);
(cost, path) = anneal(dist)
@test cost ≈ 5.67922190
@test all(path .== [50, 38, 24, 28, 35, 48, 13, 47, 17, 40, 12, 3, 31, 22, 16, 15, 14, 
    44, 34, 43, 1, 19, 37, 39, 41, 25, 7, 46, 27, 30, 42, 2, 49, 33, 45, 11, 20, 
    10, 21, 36, 4, 18, 5, 32, 26, 23, 29, 9, 8, 6])
end

end