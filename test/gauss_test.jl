module GaussTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "Gauss" begin
Random.seed!(123)
n = 100;
A = randn(n, n);
Asave = copy(A);
C = inverse(A);
@test norm(Asave * C - I, 2) < 1e-8
end

end