module WelfordTest

using Test, AlgorithmsFromTheBook, Random


@testset "welford" begin
    
  Random.seed!(123)
  (n, s) = (10, 5);
  x = randn(n)
  y = minimum_variance(x, s)

@test y ≈ [-1.355590621101197, -1.1220725081141734, -1.1046361023292959, -1.088218513936287, -0.4217686643996927]

end

end