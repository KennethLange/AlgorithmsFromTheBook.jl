module ExponentialTest

using AlgorithmsFromTheBook, Test, Random

@testset "exponential" begin
Random.seed!(123)
x = randn(2,2);
y = exponential(x)
exp(x)
x = -pi;
y = exponential(x)

@test exp(x) ≈ 0.04321391826377226
  
end

end