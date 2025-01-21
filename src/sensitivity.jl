export sensitivity
using ForwardDiff, LinearAlgebra

""" Calculates the parameter sensitivity of a fixed point x = f(x, p)."""
function sensitivity(f::Function, x::Vector, p::Vector)
  @assert norm(f(x, p) - x) <= 10^(-12)
  g(y) = f(y, p)
  dg = ForwardDiff.jacobian(g, x)
  h(q) = f(x, q)
  dh = ForwardDiff.jacobian(h, p)
  return (I - dg) \ dh
end

