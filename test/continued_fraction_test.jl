module ContinuedFraction

using Test, AlgorithmsFromTheBook, Random

@testset "continued fraction" begin
  (x, h, n) = (complex(3.0), 1.0e-10, 20); # n is a global variable
  (fvalue, df) = dcf(cfexp, x, h, n) # exponential at x 
    
  # println(exp(x))
  @test exp(x) ≈  20.085536923187668 + 0.0im
end

end



