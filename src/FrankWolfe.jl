using LinearAlgebra

"""Implements the Frank-Wolfe algorithm for quadratic programming."""
function FrankWolfe(SupportMap::Function, P::Matrix{T}, q::Vector{T}, 
  x::Vector{T}, tol) where T <: Real
#
  for iter = 1:500 
    grad = P * x + q # current gradient
    y = SupportMap(-grad)
    v = y - x
    if dot(grad, v)  > -tol # convergence test
      break
    end
    t = min(1, -dot(grad, v) / dot(v, P * v)) # step length
    x = x + t * v
  end
  return x
end

"""Finds the support point for y on the ball of radius r."""
function BallSupport(y::Vector{T}, r = one(T)) where T <: Real
#
  return (r / norm(y)) * y
end

"""Finds the support point for y on an L1 ball of radius r."""
function L1BallSupport(y::Vector{T}, r = one(T)) where T <: Real
#
  x = zeros(T, length(y))
  (v, m) = findmax(abs, y)
  x[m] = sign(y[m]) * r
  return x
end

P = 2 * [[3.0 1.0]; [1.0 1.0]];
q = [1.0, 6.0];
tol = 1e-6;
x = zeros(2); # initial value is destroyed
y = FrankWolfe(BallSupport, P, q, x, tol)
x = zeros(2);
z = FrankWolfe(L1BallSupport, P, q, x, tol)



