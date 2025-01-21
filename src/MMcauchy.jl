export MMcauchy

using LinearAlgebra, Distributions, StatsBase

"""Finds the location mu and scale sigma of Cauchy data x."""
function MMcauchy(x::Vector{T}, tol::T) where T <: Real
#
  (m, iters) = (length(x), 0)
  w = zeros(T, m) # weight vector
  (mu, sigma) = (median(x), iqr(x) / 2) # Wikipedia initial values
  (old_mu, old_sigma) = (mu, sigma)
  for iter = 1:100 # MM updates
    iters = iters + 1
    for i = 1:m # compute weights
      r = (x[i] - mu) / sigma
      w[i] = 1 / (1 + r^2)   
    end
    mu = dot(w, x) / sum(w) # MM update of mu
    s = zero(T)
    for i = 1:m
      s = s + w[i] * (x[i] - mu)^2   
    end
    sigma = sqrt(2s / m) # MM update of sigma
    if abs(old_mu - mu) + abs(old_sigma -  sigma) < tol # convergence
      break
    end
    (old_mu, old_sigma) = (mu, sigma)
  end
  return (mu, sigma, iters)
end


