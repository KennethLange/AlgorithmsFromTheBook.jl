module HouseholderTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "Householder" begin
Random.seed!(123)
(m, n) = (100, 200);
A = randn(m, n);
(Q, R) = householder_qr(A);
@test opnorm(A - Q * R, 2) < 1e-8
@test opnorm(Q' * Q - I, 2) < 1e-8
end

end
