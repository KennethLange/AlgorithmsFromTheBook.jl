module EasySVDTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "easy svd" begin
Random.seed!(123)
(m, n) = (30, 20);
A = randn(m, n);
(U, S, V) = easysvd(A);
println(norm(A - U * Diagonal(S) * V'))
@test norm(A - U * Diagonal(S) * V') < 1e-6
end

end