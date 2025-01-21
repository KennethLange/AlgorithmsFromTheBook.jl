export knapsack

using LinearAlgebra, Random

"""Implements MCMC sampling for the knapsack problem."""
function knapsack(w::Vector{T}, c::T, trials::Int) where T <: Real
#
  (p, successes)  = (length(w), 0)
  x = bitrand(p)  
  for trial = 1:trials
    i = rand(1:p)
    x[i] = !x[i] # reverse bit
    if dot(x, w) <= c # knapsack test
      successes = successes + 1
    end
  end
  return successes / trials
end

