module RayleighTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "rayleigh" begin
Random.seed!(123)
(n, tol) = (100, 1e-10)
A = randn(n, n);
A = A + A';
v = power_method(A);
(mu, v) = rayleigh(A, v, tol); # improve the power estimate
println("error = ", norm(A * v - mu * v), " mu = ",mu)
@test norm(A * v - mu * v) < 1e-8
end

end