module JacobiTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "Jacobi" begin
Random.seed!(123)
n = 100;
M = randn(n, n);
M = M + M';
Msave = copy(M);
tol = 1e-12;
(eigenvalue, eigenvector) = jacobi(M, tol);
@test opnorm(Msave * eigenvector - eigenvector * Diagonal(eigenvalue), 2) < 1e-8
end

end