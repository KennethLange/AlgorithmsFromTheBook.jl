module FFTTest

using AlgorithmsFromTheBook, LinearAlgebra, Random, Test

@testset "fft" begin
Random.seed!(123)
ln = 4;
n = 2^ln;
f = randn(n);
f = f .+ 0.0*im;
g = copy(f);
f = FFT(f, ln, false);
f = FFT(f, ln, true);
println(norm(f - g))
@test norm(f - g) < 1e-8
end

end