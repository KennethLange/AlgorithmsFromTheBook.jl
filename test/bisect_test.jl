module BisectTest

using AlgorithmsFromTheBook, Test

@testset "bisect" begin
f(x) = x^3 - 5x + 1.0
(x, iteration) = bisect(f, 0.0, 2.0, 1e-14)
@test x ≈ 0.20163967572340624
@test iteration == 48
end

end