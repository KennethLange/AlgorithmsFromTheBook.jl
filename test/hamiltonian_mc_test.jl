module HamiltonianMCTest

using LinearAlgebra, RDatasets, GLM, Plots, Test, AlgorithmsFromTheBook, Random

@testset "hamiltonian mc" begin
    
  Random.seed!(123)

  # println("Hamiltonian Monte Carlo", load_data())
  
  (X, y, q0) = my_load_data(); # load data and compute initial positions
  m = ones(length(q0)); # unit masses
  (d, trials, leaps) = (5.0e-2, 100000, 20);
  (H, q, p, acceptance_ratio) = hmc(X, y, q0, m, d, trials, leaps);
  # a1 = histogram(q[1, :], xlabel = "Intercept")
  # a2 = histogram(q[2, :], xlabel = "Sepal Length")
  # a3 = histogram(q[3, :], xlabel = "Sepal Width")
  # a4 = histogram(q[4, :], xlabel = "Petal Length")
  # a5 = histogram(q[5, :], xlabel = "Petal Width")
  # plot(a2, a3, a4, a5, layout = (2, 2), legend = false)
  # savefig("Iris.pdf")
  

@test acceptance_ratio ≈ 0.46391463914639147
  
end

end
