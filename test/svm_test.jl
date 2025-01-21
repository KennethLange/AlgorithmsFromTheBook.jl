module SVMTest

using LinearAlgebra, RDatasets, Statistics, StatsBase, Test, AlgorithmsFromTheBook, Random


@testset "svm" begin
    
  Random.seed!(123)
  (rho, tol) = (1.0, 1.0e-6); # penalty and convergence constants
  (errors, avg, stdev, b) = run_example(rho, tol);
  # println(errors) # number of training errors

@test errors ≈ 0

end
end