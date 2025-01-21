export multivariate_newton

using ForwardDiff, LinearAlgebra

""" Implements Newton's method in multiple dimension for finding a 
root of the equation f(x) = 0.""" 
function multivariate_newton(f::Function, x0::Vector, tol)
  (xold, xnew) = (copy(x0), copy(x0))
  for iteration = 1:20
    df = ForwardDiff.jacobian(f, xold) 
    xnew = xold - df \ f(xold)
    if norm(f(xnew)) < tol
      return (xnew, iteration)
    else
      xold .= xnew
    end
  end
  return (xnew, 20)
end

