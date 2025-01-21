export cg_least_squares

using LinearAlgebra, SparseArrays

""" Minimizes the function 0.5 * ||y - X * z||^2 by the conjugate 
gradient method. The scalar tolerance tests convergence."""
function cg_least_squares(X::AbstractMatrix{T}, y::Vector{T}, 
  tol::T, z = zeros(T, size(X, 2))) where T <: Real
#
  r = y - X * z # residual
  g = X' * r # negative gradient
  g_old = copy(g) # old negative gradient
  v = copy(g) # search direction
  xv = X * v
  for j = 1:size(X, 2) # conjugate gradient steps
    if norm(g) < tol break end # convergence
    if j > 1
      t = sum(abs2, g) / sum(abs2, g_old)
      @. v = g + t * v
    end
    mul!(xv, X, v) # xv = X * v
    s = sum(abs2, g) / sum(abs2, xv) 
    @. z = z + s * v
    @. r = r - s * xv
    @. g_old = g
    mul!(g, X', r) # g = X' * r
  end
  return z
end



