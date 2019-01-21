module ConjugategradientsTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, SparseArrays, Test

@testset "conj. grad." begin
Random.seed!(123)
n = 100;
A = sprandn(n, n, .01);
rho = opnorm(A, 1);
A = 0.5*(A + A') + rho * I;
x = randn(n);
b = A * x;
tol = 1e-5;
y = conjugategradients(A, b, tol);
@test norm(x - y) < 1e-5
end

end