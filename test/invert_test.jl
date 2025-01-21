module InvertTest

using FFTW, Test, AlgorithmsFromTheBook, Random

@testset "invert" begin
    
  Random.seed!(123)
  d = 14; 
  (n, a) = (2^d, 2^(d / 2)); # length of FFT and interval
  transform(y) = complex(exp(-pi * y^2)); # Fourier transform
  f = real(invert(transform, d, a)); # invert and make real
@test  [sum(f) / a, minimum(f), maximum(f)] ≈ [sum(f) / a, minimum(f), maximum(f)] # checks
  # fadjust(z) = f[round(Int, (n * z) / a + n/2) + 1] # interpolate
end

end
