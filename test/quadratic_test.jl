module QuadraticTest

using AlgorithmsFromTheBook, Test

@testset "quadratic" begin
(a, b, c) = (1.0, -2.0, 1.0)
(r1, r2) = quadratic(a, b, c)
@test r1 ≈ 1.0 + 0.0im
@test r2 ≈ 1.0 - 0.0im
end

end