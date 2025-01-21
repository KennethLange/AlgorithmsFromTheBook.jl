module NewtonQuantileTest

using Distributions, Test, AlgorithmsFromTheBook, Random


@testset "newton quantile" begin
    
  Random.seed!(123)
  
  tol = 1.0e-14
  dist = Normal(0.0, 1.0)
  q = 0.25
  x1 = Quantile(dist, q, tol)
  #
  dist = Beta(1.5, 2.0)
  q = 0.5
  x2 = Quantile(dist, q, tol)
  #
  dist = Cauchy(1.5, 2.0)
  q = 0.75
  x3 = Quantile(dist, q, tol)
  #
  dist = Epanechnikov(0.0, 1.0)
  q = 0.9
  x4 = Quantile(dist, q, tol)
  #
  dist = InverseGaussian(1.0, 0.5)
  q = 0.01
  x5 = Quantile(dist, q, tol)
  #
  dist = Gumbel(5.0, 10.0)
  q = 0.99
  x6 = Quantile(dist, q, tol)
  # println(x1," ",x2," ",x3," ",x4," ",x5," ",x6)

@test [x1,x2,x3,x4,x5,x6] ≈ [-0.6744897501960709, 0.41362749312256064, 3.5, 0.6083997886818168, 0.06661397540565041, 51.00149226775632]
end

end


