module ZipfDeviateTest

using AlgorithmsFromTheBook, Random, SpecialFunctions, Statistics, Test

@testset "Zipf rv" begin
Random.seed!(123)
(s, n) = (5.0, 10000);
x = zipf_deviate(s, n);
avg = zeta(s - 1.0) / zeta(s) # theoretical mean
v = zeta(s - 2.0) / zeta(s) - avg^2 # theoretical variance
println("mean ratio = ", mean(x) / avg, " var ratio = ", var(x) / v)
@test isapprox(mean(x), avg, atol=1e-2)
@test isapprox(var(x), v, atol=1e-2)
end

end
