module GramSchmidtTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "Gram Schmidt" begin
Random.seed!(123)
(n, p) = (100, 20);
X = randn(n, p);
y = randn(n);
beta = least_squares(X, y)
@test norm(beta - X \ y) < 1e-8
end

end