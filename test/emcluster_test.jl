module EMClusterTest

using AlgorithmsFromTheBook, Random, Test

@testset "EM cluster" begin
Random.seed!(123)
k = 3;
X = randn(100, 300);
X[:, 101:200] = X[:, 101:200] .+ 0.25;
X[:, 201:300] = X[:, 201:300] .+ 0.50;
guess = rand(1:k, 300);
(class, center) = kmeans(X, guess, k);
assign = emcluster(X, class, 1e-6);
for i = 1:300
  #println(" kmeans class = ",class[i]," postprob = ", assign[i,:])
  @test isapprox(sum(assign[i,:]), 1, rtol=1e-6)
end
end


end