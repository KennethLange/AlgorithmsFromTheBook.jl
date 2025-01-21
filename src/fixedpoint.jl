export fixedpoint

using LinearAlgebra, SparseArrays

"""Solves the equation (M - N) x = y by matrix splitting."""
function fixedpoint(M::AbstractMatrix{T}, N::AbstractMatrix{T}, 
  x::Vector, y::Vector{T}, tol::T) where T <: Real
#
  iter = 0
  crit = norm(y) * tol # convergence criterion
  for i = 1:500
    iter = i
    if norm(y - M * x + N * x) < crit 
      break
    end
    x = M \ (N * x + y)
  end
  return (iter, x)
end


