module KmeansTest

using AlgorithmsFromTheBook, Random, Test

@testset "K-means" begin
Random.seed!(123)
k = 3;
X = randn(100, 300);
X[:, 101:200] = X[:, 101:200] .+ 1.0; 
X[:, 201:300] = X[:, 201:300] .+ 2.0; 
class = rand(1:k, 300); # k classes randomly assigned
(class, center) = kmeans(X, class, k);
# println(class)
@test length(class) == 300
@test size(center) == (100, k)
end

end