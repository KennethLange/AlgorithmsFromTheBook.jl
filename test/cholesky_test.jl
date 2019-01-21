module CholeskyTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "cholesky" begin
Random.seed!(123)
n = 100;
M = randn(n, n);
A = M * M';
Asave = copy(A);
b = randn(n);
bsave = copy(b);
L = AlgorithmsFromTheBook.cholesky(A);
x = choleskysolve(L, b);
@test norm(bsave - Asave * x) < 1e-8
end

end