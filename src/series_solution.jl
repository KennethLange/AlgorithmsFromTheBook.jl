export SeriesSolution

using LinearAlgebra

"""Solves the equation (d I + A) x = y by a series method. If r is 
the spectral radius of A, then r / d < 1 should hold."""
function SeriesSolution(A::AbstractMatrix{T}, y::Vector{T}, d::T, 
  tol::T) where T <: Real
#
  r = - one(T) / d
  x = - r * y
  v = copy(x)
  while norm(v) > tol
    v = r * (A * v)
    x = x + v
  end
  return x
end
