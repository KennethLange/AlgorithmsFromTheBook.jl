module DirichletTest

using AlgorithmsFromTheBook, Distributions, Random, Statistics, Test

@testset "Dirichlet MLE" begin
Random.seed!(123)
(n, p) = (1000, 3);
lambda = 5 * rand(p);
X = rand(Dirichlet(lambda), n);
lambda1 = fit_mle(Dirichlet, X);
println("Package estimated parameters = ", lambda1);
lambda2 = dirichlet(X);
println("Direct estimated parameters = ", lambda2);
@test all(isapprox.(params(lambda1)[1], lambda2; rtol=1e-3))
end

end