export inv_lower_tri

using LinearAlgebra

"""Inverts a lower triangular matrix."""
function inv_lower_tri(L::AbstractMatrix{T}) where T <: Real
  m = size(L, 1)
  n = div(m, 2)
  invL1 = inv(L[1:n, 1:n])
  invL2 = inv(L[n + 1:end, n + 1:end])
  A = -invL2 * L[n + 1:end, 1:n] * invL1 
  return [invL1 zeros(T, n, m - n); A invL2] 
end
