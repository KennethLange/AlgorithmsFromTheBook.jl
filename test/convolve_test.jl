module ConvolveTest

using AlgorithmsFromTheBook, LinearAlgebra, Test

@testset "convolve" begin
a = [1, 2, 1];
b = [1, 3, 2, 1];
c1 = convolve(a, b);
@test all(c1 .== [1, 5, 9, 8, 4, 1])
c2 = real(fftconvolve(a, b))
@test norm(c2 - [1.0, 5.0, 9.0, 8.0, 4.0, 1.0, 8.88178e-16, 0.0]) < 1e-8
end

end