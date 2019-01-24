export newton

""" Implements Newton's method in one dimension for finding a 
root of the equation f(x) = 0. fp is the derivative of f(x)."""
function newton(f::Function, fp::Function, x::Real, tol::Real)
  (xold, xnew) = (x, zero(x))
  for iteration = 1:100
    xnew = xold - f(xold) / fp(xold)
    if abs(f(xnew)) < tol
      return (xnew, iteration)
    end
    xold = xnew
  end
  return (xnew, 100)
end
