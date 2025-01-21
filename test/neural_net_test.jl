module NeuralNetTest

using LinearAlgebra, Plots, RDatasets, StatsBase, Test, AlgorithmsFromTheBook, Random

@testset "neural net" begin
  
  Random.seed!(123);
  df = dataset("count", "titanic");
  y = convert(Vector{Float64}, df[:, 1]); # responses
  y = reshape(y, 1, length(y)); # matrix with 1 row
  XT = Tables.matrix(df[:, 2:4]); # cases by predictors
  X = Matrix(XT'); # predictors by cases
  X = convert(Matrix{Float64}, X); # make entries are real
  nodes = [size(X, 1), 1]; # final output entry 1
  fun = (sigmoid, logistic); # activation and loss
  (t, iters, plot_name) = (0.001, 1000, "Titanic.png");
  (par, obj) = train(nodes, X, y, t, iters, fun, plot_name);
  # println(par)

@test par["W1"] ≈ reshape([-1.0522158805403674 -2.366359360302287 -0.8738680907355333], 1, 3)
end
end


