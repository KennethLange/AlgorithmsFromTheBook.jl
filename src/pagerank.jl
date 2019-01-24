using SparseArrays
export pagerank

"""Implements the pagerank algorithm. Q is the transpose of the transition
probability matrix, u is the initial value of the equilibrium distribution, 
and 1-alpha is the probability of moving at each epoch according to Q."""
function pagerank(Q::SparseMatrixCSC{T}, u::Vector{T}, 
  alpha::T, n::Int) where T <: Real
#
  c = alpha / length(u)
  for i = 1:n
    u = (one(T) - alpha) * (Q * u) .+ c
  end
  return u
end

