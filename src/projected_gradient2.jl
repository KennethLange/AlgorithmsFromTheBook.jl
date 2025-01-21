using LinearAlgebra, ForwardDiff
export ProjectedGradient2, BallProjection, OrthantProjection


"""Projects y onto the closed ball with a given radius r."""
function BallProjection(y::Vector{T}, r = one(T)) where T <: Real
  distance = norm(y)
  if distance > r
    return (r / distance) * y
  else
    return y
  end
end

"""Projects the point y onto the nonengative orthant."""
function OrthantProjection(y::Vector{T}) where T <: Real
  return max.(y, zero(T))
end

"""Implements projected gradient descent."""
function ProjectedGradient2(f::Function, Proj::Function, x, L, tol)
  xnew = similar(x)
  for iteration = 1:500
    xnew =  Proj(x - ForwardDiff.gradient(f, x) /  L)
    if norm(x - xnew) < (1 + norm(x)) * tol
      return (xnew, f(xnew))
    else
      x .= xnew
    end
  end
  return (x, f(x))
end
