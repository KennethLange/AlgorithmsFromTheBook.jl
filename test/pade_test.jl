module PadeTest

using LinearAlgebra, Plots, Random, Test, AlgorithmsFromTheBook



@testset "pade" begin
    
  Random.seed!(123)
  
  a = [1, 1, 1//2, 1//6, 1//24, 1//120];
  (q, p) = pade_coefficients(a, 2) # denominator degree = 2
  # println("p = ",p," q = ",q)
  pade_deviation(x) = exp(x) - pade_approximation(p, q, x)
  taylor_deviation(x) = exp(x) - horner(a, x) 
  # plot([pade_deviation, taylor_deviation], xlabel = "x", -3.0, 3.0)
  # savefig("Pade_figure.pdf")

@test p ≈ Rational{Int64}[1, 3//5, 3//20, 1//60]
@test q ≈ Rational{Int64}[1, -2//5, 1//20]

end

end