module LogisticTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "logistic" begin
Random.seed!(123)
(n, p, tol) = (100, 10, 1e-6);
(X, y, beta) = (randn(n, p), zeros(n), randn(p));
fill!(X[:, 1], 1.0); # intercept
for i = 1:n
  x = vec(X[i, :])
  inner = dot(x, beta)
  if rand() < exp(inner) / (exp(inner) + 1.0)
    y[i] = 1.0
  else
    y[i] = 0.0
  end
end
alpha = copy(beta);
(beta, iteration) = logistic(X, y, tol);
println(norm(beta - alpha))
@test length(alpha) == length(beta)
end

end