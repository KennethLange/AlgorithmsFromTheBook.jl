export hmc, my_load_data

using LinearAlgebra, RDatasets, GLM, Plots, Random
 
"""Implements leapfrog steps in HMC."""
function leap_frog(X::Matrix{T}, y::Vector{T}, q::Vector{T}, 
  p::Vector{T}, m::Vector{T}, d::T, leaps::Int) where T <: Real
#
  (H, grad) = hamiltonian(X, y, q, p, m) # Hamiltonian & gradient 
  for l = 1:leaps # leap frog proposal
    @. p = p - (d / 2) * grad
    @. q = q + d * (p / m)
    (H, grad) = hamiltonian(X, y, q, p, m)
    @. p = p - (d / 2) * grad
  end
  return (q, p) 
end

"""Calculates HMC objective and gradient."""
function hamiltonian(X::Matrix{T}, y::Vector{T}, q::Vector{T}, 
  p::Vector{T}, m::Vector{T}) where T <: Real
#
  hyper = 1000 * one(T) # define prior hyperparameter
  (H, grad) = (zero(T), zeros(T, length(q)))
  for i = 1:length(y) # compute Hamiltonian and gradient
    x = vec(X[i, :]) # predictor vector for case i
    inner = dot(x, q)  
    prob = one(T) / (one(T) + exp(-inner))
    H = H - log(abs(prob + y[i] - one(T)))
    @. grad = grad - (y[i] - prob) * x
  end
  H = H + norm(q)^2 / (2hyper) # add logprior
  @. grad = grad + q / hyper 
  for i = 1:length(p) # add momentum contributions
    H = H + p[i]^2 / (2m[i])
  end
  return (H, grad)
end

"""Implements HMC."""
function hmc(X::Matrix{T}, y::Vector{T}, q0::Vector{T}, m::Vector{T}, 
  d::T, trials::Int, leaps::Int) where T <: Real
#
  (q, p) = (repeat(q0, 1, trials), zeros(T, length(q0), trials))
  (H, accepted) = (zeros(T, trials), 0) 
  (H[1], grad) = hamiltonian(X, y, q[:, 1], p[:, 1], m)
  for i = 2:trials
    p[:, i] .= randn(T, size(p, 1)) .* sqrt.(m) # Gaussian momenta
    q[:, i] .= q[:, i - 1]
    (q[:, i], p[:, i]) = leap_frog(X, y, q[:, i], p[:, i], m, d, leaps)
    (H[i], grad) = hamiltonian(X, y, q[:, i], p[:, i], m)
    acceptance = min(exp(H[i - 1] - H[i]), one(T)) # Metropolis
    if rand(T) > acceptance
      H[i] = H[i - 1] # decline proposal
      q[:, i] .= q[:, i - 1]
      p[:, i] .= p[:, i - 1]
    else
      accepted = accepted + 1
    end
  end
  return (H, q, p, accepted / (trials - 1)) 
end

"""Loads Fisher's iris data from R and performs logistic regression."""
function my_load_data()
  iris = dataset("datasets", "iris") # R dataset
  iris[:, :Indicator] .= 0.0 # add indicator variable
  for i = 1:size(iris, 1)
    if iris[i, :Species] == "setosa"
      iris[i, :Indicator] = 1.0
    end
  end

  fm = @formula(Indicator ~ SepalLength + SepalWidth 
       + PetalLength + PetalWidth)
  logistic = glm(fm, iris, Binomial(), LogitLink()) # regression
  X = Matrix(iris[:, 1:4])
  X = [ones(size(X, 1)) X] # add intercept feature
  y = Vector(iris[:, :Indicator])
  return (X, y, coef(logistic))
end


