module NewtonTest

using AlgorithmsFromTheBook, Test

@testset "newton" begin
f(x) = x^3 - 2x - 5.0
fp(x) = 3x^2 - 2.0
(x, iterations) = newton(f, fp, 2.5, 1e-14)
@test abs(f(x)) < 1e-8
end

end