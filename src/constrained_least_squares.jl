using LinearAlgebra
export constrained_lsq

"""Minimize the least squares criterion 1/2 ||b - A x ||^2 subject
to C x = d via a penalty method and Langrange multiplier method."""
function constrained_lsq(A::Matrix{T}, C::Matrix{T}, b::Vector{T},
  d::Vector{T}, gamma::T) where T <: Real
#
  E = [A; sqrt(gamma) * C]
  f = [b; sqrt(gamma) * d]
  x = E \ f  # penalty estimate
#
  s = size(C, 1)
  E = [A'A  C'; C zeros(T, s, s)]
  f = [A'b; d]
  u = E \ f  # Lagrange multiplier estimate
  return (x, u)   
end


