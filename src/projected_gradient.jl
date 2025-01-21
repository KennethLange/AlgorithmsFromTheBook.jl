export ProjectedGradient

using LinearAlgebra

"""Projects y onto the closed ball with a given radius r."""
function BallProj(y::Vector{T}, r = one(T)) where T <: Real
  distance = norm(y)
  if distance > r
    return (r / distance) * y
  else
    return y
  end
end

"""Minimizes ||y-X*b||^2 subject to ||b|| <= r by projected gradient descent."""
function ProjectedGradient(X::Matrix{T}, y::Vector{T}, r::T, 
  tol::T) where T <: Real
#
 (n, p) = size(X)
  L = opnorm(X)^2 # Lipschitz constant
 (g, bnew, bold) = (zeros(T, p), zeros(T, p), zeros(T, p))
  for iteration = 1:500 # projected gradient updates
    g = X' * (X * bold - y) # gradient
    bnew = BallProj(bold - g / L, r) # projection
    if norm(bnew - bold) < tol * (1 + norm(bold)) # test
      break
    else
      bold .= bnew
    end
  end
  return (bnew, norm(y - X * bnew))
end
