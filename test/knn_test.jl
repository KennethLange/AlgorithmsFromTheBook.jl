module KnnTest

using AlgorithmsFromTheBook, Random, Test

@testset "knn" begin
Random.seed!(123)
(training, testing, features) = (100, 10, 30);
X = randn(features, testing);
Y = randn(features, training);
(k, classes) = (3, 2);
class = rand(1:classes, training);
predicted_class = knn(X, Y, class, k)
@test all(predicted_class .== [1, 1, 1, 2, 1, 2, 1, 2, 2, 1])
end

end